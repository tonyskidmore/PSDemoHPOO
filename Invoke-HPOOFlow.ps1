#region functions

function Set-TrustAllCertPolicy () {
    
    
    if ( -not ("TrustAllCertsPolicy" -as [type])) {
        Add-Type @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(
                ServicePoint srvPoint, X509Certificate certificate,
                WebRequest request, int certificateProblem) {
                return true;
            }
        }
    
"@    

    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

    }
}

#endregion functions

$config = Get-Content -Path $PSScriptRoot\config.json | ConvertFrom-Json

$headers = @{
    'Authorization' = $config.Authorization
}

$body = @{
    'uuid' = $config.UUID
}

$invokeParams = @{
    'Uri' = $config.Uri
    'Headers' = $headers
    'Method' = $config.Method
    'ContentType' = $config.ContentType
    'Body' = $body | ConvertTo-Json
}

try {
    if(([System.Environment]::OSVersion.Platform -eq 'Win32NT' )) {
        # just disable certificate check - only for demo purposes
        Set-TrustAllCertPolicy
        $result = Invoke-RestMethod @invokeParams -ErrorAction Stop
    }
    elseif (([System.Environment]::OSVersion.Platform -eq 'Unix' )) {
        $invokeParams.Add('SkipCertificateCheck',$true)
        $result = Invoke-RestMethod @invokeParams -ErrorAction Stop
    }
    
}
catch {
    Write-Output "Here we could do something with $($_.Exception.Message)"
    throw $_    
}

$result
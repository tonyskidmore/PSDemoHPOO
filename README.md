# PowerShell Cross Platform Demo

This script is an example demo script that uses Invoke-RestMethod to trigger HPOO workflow.  It can be run in eiether a Windows or Linux environment!  

Disclaimer: It is a quick and dirty script that does not represent best practice for script development.

In the demo the script was ran on a Windows 10 machine running PowerShell 5.1.  
For the Linux demo it was ran on a CentOS 7.4 system.

Obviously the Invoke-RestMethod relies on a configured instance of HPOO installed with the revelant flow and user configured to this only written to run in the demo environment.  However, it does give you a basic idea of how you could run the same PowerShell script in both Linux and Windows.

## Prequisites

- To install PowerShell in a CentOS 7 platform follow the [PowerShell on GitHub](https://github.com/PowerShell/PowerShell/blob/master/docs/installation/linux.md#centos-7) instructions.
- You will need git installed on your [CentOS](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-centos-7) and/or [Windows](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) machine.



## Installation (Windows and Linux)

```
git clone https://github.com/tonyskidmore/PSDemoHPOO.git
```
## Execution Windows

- Run PowerShell
```
cd PSDemoHPOO
./Invoke-HPOOFlow.ps1
```

## Execution Linux (PowerShell Core Beta 9 and above uses pwsh as opposed to powershell)
```
pwsh
cd PSDemoHPOO
./Invoke-HPOOFlow.ps1
```

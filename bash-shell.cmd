set HOME=%cd%

:: Portable Environment Variables
call %~dp0%\ev.cmd
:: Open bash 
start /d %HOME% tools\Git\git-bash.exe
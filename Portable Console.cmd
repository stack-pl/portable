:: Add node directory to "PATH" environment variable
set Path=%~dp0node;%Path%

:: Default home directory
set HOME=%~dp0home

:: Open bash 
start /d %HOME% Git\git-cmd.exe
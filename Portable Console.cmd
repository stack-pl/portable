:: Add node directory to "PATH" environment variable
set PATH=%~dp0node;%PATH%

:: Default home directory
set HOME=%~dp0home\projects

:: Open bash 
start /d %HOME% Git\git-cmd.exe
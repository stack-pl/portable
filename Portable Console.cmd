:: Add node and VS Code directory to "PATH" environment variable
set PATH=%cd%\node;%cd%\VSCode;%PATH%

:: Add Git and MinGW paths
set PATH=%cd%\Git\bin;%cd%\Git\usr\bin;%cd%\Git\cmd;%PATH%
set gitdir=%cd%\Git
set HOME=%cd%\home
::set USERPROFILE=%HOME%

:: Open bash 
start /d %HOME% Git\git-cmd.exe
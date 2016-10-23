:: Add node directory to "PATH" environment variable
set PATH=%cd%;%PATH%

:: Add Git and MinGW paths
set PATH=%cd%Git\bin;%cd%Git\usr\bin;%PATH%

:: Default home directory
set HOME=%cd%\home

:: Open bash 
start /d %HOME% Git\git-cmd.exe
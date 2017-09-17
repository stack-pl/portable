set HOME=%cd%

:: Set JDK instance
set JDK_HOME=%~dp0tools\Java
set JAVA_HOME=%JDK_HOME%
set CLASSPATH=%JAVA_HOME%\jre\lib
set CLASSPATH=%JDK_HOME%\lib;%CLASSPATH%
::set CLASSPATH=".;%CLASSPATH%"
::set CLASSPATH="."
::set PATH=%JAVA_HOME%\jre\bin;%PATH%
set PATH=%JDK_HOME%\bin;%PATH%

:: Set nodejs instance
set PATH=%~dp0tools\nodejs;%PATH%

:: Set Python3 instance
set PY_HOME=%~dp0tools\Python3
set PYTHONPATH=%PY_HOME%\Lib;%PY_HOME%\DLLs
set PATH=%PY_HOME%\Scripts;%PATH%
set PATH=%PY_HOME%;%PATH%


:: Set GCC (and MinGW) instance
set PATH=%~dp0tools\gcc\bin;%PATH%
set LIBRARY_PATH=%~dp0tools\gcc\lib64

:: Default home directory
set HOME=%~dp0work

:: Open bash 
start /d %HOME% tools\Git\git-bash.exe
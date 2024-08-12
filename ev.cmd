@echo off
set HOME=%cd%
set EV_INFO=%HOME%\%0%

:: Java environment
call %~dp0%\tools\java\current.cmd
set JDK_HOME=%~dp0tools\java\%CURRENT_JDK%
set JAVA_HOME=%JDK_HOME%
set CLASSPATH=%JAVA_HOME%\jre\lib
set CLASSPATH=%JDK_HOME%\lib;%CLASSPATH%
rem ::set CLASSPATH=".;%CLASSPATH%"
rem ::set CLASSPATH="."
rem ::set PATH=%JAVA_HOME%\jre\bin;%PATH%
set PATH=%JDK_HOME%\bin;%PATH%
set JAVA_INFO=Java  %CURRENT_JDK%            (%JDK_HOME%)

:: Set nodejs instance
call %~dp0%\tools\nodejs\current.cmd
set NODE_HOME=%~dp0tools\nodejs\%CURRENT_NODE%
set PATH=%NODE_HOME%;%PATH%
set NODE_INFO=NodeJS  %CURRENT_NODE%         (%NODE_HOME%)

:: Set Python3 instance
call %~dp0%\tools\python\current.cmd
set PY_HOME=%~dp0tools\python\%CURRENT_PYTHON%
set PYTHONPATH=%PY_HOME%\Lib;%PY_HOME%\DLLs
set PATH=%PY_HOME%;%PY_HOME%\Scripts;%PATH%
set PY_INFO=Python  %CURRENT_PYTHON%         (%PY_HOME%)

:: Set Rust instance
call %~dp0%\tools\rust\current.cmd
set CARGO_HOME=%~dp0tools\rust\%CURRENT_RUST%\.cargo
set RUSTUP_HOME=%~dp0tools\rust\%CURRENT_RUST%\.rust
set PATH=%CARGO_HOME%\bin;%PATH%
set RUST_INFO=Rust  %CURRENT_RUST%         (%~dp0tools\rust\%CURRENT_RUST%)

:: Set R instance
call %~dp0%\tools\r\current.cmd
set R_HOME=%~dp0tools\r\%CURRENT_R%\r_app
set RSTUDIO_HOME=%~dp0tools\r\%CURRENT_R%\rstudio
rem set R_LIBS=%~dp0tools\r\%CURRENT_R%\r_libs
set R_USER=%~dp0projects
set R_LIBS_USER=%~dp0tools\r\%CURRENT_R%\r_libs_user
set PATH=%R_HOME%\bin;%R_HOME%\bin\x64;%RSTUDIO_HOME%;%PATH%

:: Set GCC (and MinGW) instance
set PATH=%~dp0tools\gcc\bin;%PATH%
set LIBRARY_PATH=%~dp0tools\gcc\lib64

:: Set Helix instance
set HELIX_HOME=%~dp0tools\helix\
set PATH=%HELIX_HOME%;%PATH%

:: Set LazyGit instance
set LAZYGIT_HOME=%~dp0tools\lazygit\
set PATH=%LAZYGIT_HOME%;%PATH%

:: Set Visual Studio Code instance
set VSCODE_HOME=%~dp0tools\vscode\
set PATH=%VSCODE_HOME%;%PATH%

:: Default home directory
set HOME=%~dp0
set APPDATA=%~dp0.config

:: Open bash 
cd %HOME%
@echo on
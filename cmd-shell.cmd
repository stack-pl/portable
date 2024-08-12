@echo off
call ev.cmd
@echo off
cd %HOME%
title PORTABLE SANDBOX
echo PORTABLE SANDBOX  v.2024.1
echo   Projects folder:          %HOME%projects\
echo     Configuration:            %EV_INFO%
echo     Tools:                    %HOME%tools\
tools\Git\git-cmd.exe
@echo on
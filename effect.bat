@echo off
setlocal enabledelayedexpansion
set root=%~dp0
set source=%root%resource\
set target=%root%map\script\≤‚ ‘\effect_file.lua

echo %root% 
echo %source% 
echo %target% 


::Â§ÑÁêÜÂ≠óÁ¨¶‰∏≤
echo local str = { > "%target%"  
::dir /s /b  %source%*.mdx  %source%*.mdl
for /f "delims=" %%G in ('dir /s /b  %source%*.mdx  %source%*.mdl') do (
set str=%%G 
echo [[!str:~37,-1!]],>> "%target%"
) 
echo } >> "%target%"
echo return str >> "%target%"
copy %target% %root% /y 
move %root%effect_file.lua %root%effect_file.txt


::÷±Ω”‘À––
cd /d %~dp0
for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\Blizzard Entertainment\Warcraft III" /v "InstallPath" ^| find /i "InstallPath"') do set "war_path=%%k"
set war3Path=%war_path%
echo war3Path:%war3Path%

for /f "tokens=1,2,* " %%i in ('REG QUERY HKEY_CURRENT_USER\Software\Classes\Applications\YDWE.exe\shell\open\command') do set "ydwe=%%k"
set ydwePath=%ydwe:~1,-15%
echo ydwePath:%ydwePath%

set w3x2lni=%~dp0tools\w3x2lni 

::echo "%w3x2lni%"

::echo "%cd%"
set mapName=muban_defence_11
set mapPath="%war3Path%\Maps\vscode\%mapName%.w3x"
echo %mapPath%
set Path="%ydwePath%\bin\YDWEConfig.exe"
echo %Path%
cd %Path%
%Path% -launchwar3 -loadfile %mapPath%

pause
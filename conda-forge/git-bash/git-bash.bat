@echo off
set "_name=git-bash"
set "_dir="

set "_bash_dir=%~dp0\..\Library\%_name%"
if not exist "%_bash_dir%\post-install.bat" goto skip
call "%~dp0\git-bash-post-install.bat" || exit /b 1
del "%_bash_dir%\post-install.bat" || exit /b 1
:skip
"%_bash_dir%\%_dir%%~n0.exe" %*
:: the first successful run of %~n0.bat would overwrite it:
del "%~dp0\git-bash-post-install.bat"
echo @"%%~dp0\..\Library\%_name%\%_dir%%~n0.exe" %%* > "%~dp0\%~n0.bat"

@echo off
set "_bash_dir=%~dp0\..\Library\git-bash-win"
if not exist "%_bash_dir%\post-install.bat" goto skip

:: post install:
set "_PATH=%PATH%"
set "_CWD=%CD%"

cd /d "%_bash_dir%" || exit 1
set "PATH=%CD%\cmd;%PATH%"
git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat || exit 1
del "%_bash_dir%\post-install.bat" || exit 1

set "PATH=%_PATH%"
cd /d "%_CWD%"

:skip
"%_bash_dir%\bin\bash.exe" %*
:: the first successful run of bash.bat would overwrite it:
echo @"%%~dp0\..\Library\git-bash-win\bin\bash.exe" %%* > "%~dp0\bash.bat"

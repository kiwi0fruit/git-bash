@echo off
set "_name=git-bash"
set "_dir="

set "_bash_dir=%~dp0\..\Library\%_name%"
if not exist "%_bash_dir%\post-install.bat" goto skip

:: post install:
set "_CWD=%CD%"
cd /d "%_bash_dir%" || exit /b 1
set "_PATH=%PATH%"
set "PATH=%CD%\cmd;%PATH%"
.\git-bash.exe --no-needs-console --hide --no-cd ^
--command=post-install.bat > __stdout__ 2> __stderr__
if not %errorlevel%==0 (
    type __stderr__ 1>&2
    type __stdout__
    del __stdout__ && del __stderr__
    exit /b %errorlevel%
)
set "_err="
set /p _err=<__stderr__
if defined _err if not "%_err%" == "" (
    type __stderr__ 1>&2
    type __stdout__
    del __stdout__ && del __stderr__
    exit /b 1
)
if exist __stdout__ del __stdout__ || exit /b 1
if exist __stderr__ del __stderr__ || exit /b 1
cd /d "%_CWD%"
set "PATH=%_PATH%"
set "_err=" && set "_CWD=" && set "_PATH="
del "%_bash_dir%\post-install.bat" || exit /b 1

:skip
"%_bash_dir%\%_dir%%~n0.exe" %*
:: the first successful run of %~n0.bat would overwrite it:
echo @"%%~dp0\..\Library\%_name%\%_dir%%~n0.exe" %%* > "%~dp0\%~n0.bat"

@echo off
setlocal
for %%a in ("%~dp0") do for %%b in ("%%~dpa.") do set _root=%%~dpb
:: %_root%Some_Dir\This_Script.bat
set "_bash=%_root%Library\git-bash-win"
if exist "%_bash%\" rmdir /s/q "%_bash%" || echo cannot delete "%_bash%" that already exists 1>&2 && exit 1

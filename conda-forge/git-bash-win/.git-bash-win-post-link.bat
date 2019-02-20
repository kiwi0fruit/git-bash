@echo off
:: debug:
chcp 65001 > nul
set "LANG=C.UTF-8"
::
set "_bash=%PREFIX%\Library\git-bash-win"
set "PATH=%_bash%\cmd;%PATH%"
cd /d "%_bash%" || exit 1
::git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat
call .\post-install.bat

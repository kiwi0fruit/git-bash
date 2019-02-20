@echo off
set "_bash=%PREFIX%\Library\git-bash-win"
set "PATH=%_bash%\cmd;%PATH%"
cd /d "%_bash%" || exit 1
git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat || exit 1
del "%_bash%\post-install.bat" || exit 1

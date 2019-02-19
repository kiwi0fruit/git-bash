@echo off
cd /d "%PREFIX%\Library\git-bash-win" || exit 1
git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat

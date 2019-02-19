@echo off
setlocal
for %%a in ("%~dp0") do for %%b in ("%%~dpa.") do set _root=%%~dpb
:: %_root%Some_Dir\This_Script.bat
cd /d "%_root%Library\git-bash" || exit 1
git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat || exit 1

@echo off
setlocal
for %%a in ("%~dp0") do for %%b in ("%%~dpa.") do set _root=%%~dpb
:: %_root%Some_Dir\This_Script.bat
"%_root%Library\git-bash\bin\bash.exe" %*

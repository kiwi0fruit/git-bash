@echo off
set "_bash=%PREFIX%\Library\git-bash-win"
if exist "%_bash%\" rmdir /s/q "%_bash%" || echo Cannot delete "%_bash%" (it is safe to delete it) 1>&2 && exit 1

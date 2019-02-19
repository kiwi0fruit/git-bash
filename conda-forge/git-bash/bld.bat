set "_bash=%LIBRARY_PREFIX%\git-bash-win"
mkdir -p "%_bash%" || exit 1
7za x PortableGit-%PKG_VERSION%-%ARCH%-bit.7z.exe -o"%_bash%" -aoa || exit 1

move "%_bash%\LICENSE.txt" .\ || exit 1
del "%_bash%\README.portable" || exit 1

if not exist "%PREFIX%\Menu" mkdir -p "%PREFIX%\Menu" || exit 1
copy "%RECIPE_DIR%\git-bash-win.json" "%PREFIX%\Menu\" || exit 1
copy "%RECIPE_DIR%\git-bash-win.ico" "%PREFIX%\Menu\" || exit 1

if not exist "%PREFIX%\bin" mkdir -p "%PREFIX%\bin" || exit 1
copy "%RECIPE_DIR%\bash.bat" "%PREFIX%\bin\" || exit 1

if not exist "%SCRIPTS%" mkdir -p "%SCRIPTS%" || exit 1
copy "%RECIPE_DIR%\.git-bash-win-post-link.bat" "%SCRIPTS%\" || exit 1
copy "%RECIPE_DIR%\.git-bash-win-pre-link.bat" "%SCRIPTS%\" || exit 1

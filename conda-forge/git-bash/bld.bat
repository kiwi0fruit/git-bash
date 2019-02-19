mkdir "%LIBRARY_PREFIX%\git-bash" || exit 1
7za x PortableGit-%PKG_VERSION%-%ARCH%-bit.7z.exe -o"%LIBRARY_PREFIX%\git-bash" -aoa || exit 1

move "%LIBRARY_PREFIX%\git-bash\LICENSE.txt" .\ || exit 1
del "%LIBRARY_PREFIX%\git-bash\README.portable" || exit 1

IF NOT EXIST "%PREFIX%\Menu" mkdir -p "%PREFIX%\Menu" || exit 1
copy "%RECIPE_DIR%\git-bash-win.json" "%PREFIX%\Menu\" || exit 1
copy "%RECIPE_DIR%\git-bash-win.ico" "%PREFIX%\Menu\" || exit 1

if not exist "%PREFIX%\bin" mkdir "%PREFIX%\bin" || exit 1
copy "%RECIPE_DIR%\bash.bat" "%PREFIX%\bin\" || exit 1

if not exist "%SCRIPTS%" mkdir "%SCRIPTS%" || exit 1
copy "%RECIPE_DIR%\.git-bash-post-link.bat" "%SCRIPTS%\" || exit 1

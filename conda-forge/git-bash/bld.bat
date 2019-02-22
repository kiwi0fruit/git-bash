set "_bash_dir=%LIBRARY_PREFIX%\git-bash"
mkdir "%_bash_dir%" || exit 1
7za x PortableGit-%PKG_VERSION%-%ARCH%-bit.7z.exe -o"%_bash_dir%" -aoa || exit 1

copy "%_bash_dir%\LICENSE.txt" .\ || exit 1
set "_post=%_bash_dir%\etc\post-install"
patch -i "%RECIPE_DIR%\01-devices.post.patch" "%_post%\01-devices.post" || exit 1
patch -i "%RECIPE_DIR%\post-install.bat.patch" "%_bash_dir%\post-install.bat" || exit 1

mkdir "%RECIPE_DIR%\post-install" || exit 1
move "%_post%\06-windows-files.post" "%_post%\99-post-install-cleanup.post" "%RECIPE_DIR%\post-install\" || exit 1
call "%~dp0\git-bash-post-install.bat" || exit 1
rmdir /s "%_post%" || exit 1
move "%RECIPE_DIR%\post-install" "%_bash_dir%\etc\" || exit 1

if not exist "%PREFIX%\bin" mkdir "%PREFIX%\bin" || exit 1
copy "%RECIPE_DIR%\bash.bat" "%PREFIX%\bin\" || exit 1
copy "%RECIPE_DIR%\git-bash.bat" "%PREFIX%\bin\" || exit 1

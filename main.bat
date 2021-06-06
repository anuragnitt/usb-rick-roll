@echo off

set prank_dir=C:\usb_prank
set startup_dir=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:: performs file cleanup
call "%~dp0\scripts\cleanup.bat"

:: creates a directory for prank files
mkdir "%prank_dir%"

:: copies the required files
echo f | xcopy /f "%~dp0\audio.wav" "%prank_dir%"
echo f | xcopy /f "%~dp0\scripts\device_insert.bat" "%prank_dir%"

:: executes device_insert.bat
call "%~dp0\scripts\device_insert.bat"

:: creates a shortcut for device_insert.bat
C:\Windows\SysWOW64\cscript.exe "%~dp0\shortcut.vbs"

:: device_insert.bat will be executed automatically on startup
move "%prank_dir%\device_insert.lnk" "%startup_dir%"

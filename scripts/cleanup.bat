@echo off

set prank_dir=C:\usb_prank
set startup_dir=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:: removes the files created in the system
if exist "%prank_dir%" rmdir /s /q "%prank_dir%"
if exist "%startup_dir%\device_insert.lnk" del /f /q "%startup_dir%\device_insert.lnk"

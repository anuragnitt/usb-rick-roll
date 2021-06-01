set prank_dir=usb_prank

:: create the directory if not present already
if not exist "C:\%prank_dir%" mkdir "C:\%prank_dir%"

:: copy the required files
echo f | xcopy /f "%~dp0\audio.wav" "C:\%prank_dir%"
echo f | xcopy /f "%~dp0\device_insert.bat" "C:\%prank_dir%"

:: register the .wav file to play when an usb device is inserted
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes"                                             /t REG_SZ /d ".%prank_dir%"  /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current"             /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"        /t REG_SZ /d "C:\%prank_dir%\audio.wav"       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current"      /t REG_SZ /d "C:\%prank_dir%\audio.wav"       /f

:: create a shortcut for device_insert.bat
C:\Windows\SysWOW64\cscript.exe "%~dp0\shortcut.vbs"

:: device_insert.bat is executed automatically on startup
move "C:\%prank_dir%\device_insert.lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

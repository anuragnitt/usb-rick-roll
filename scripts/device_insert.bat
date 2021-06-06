@echo off

set prank_dir=C:\usb_prank

:: registers audio.wav to play when an usb device is inserted
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes"                                             /t REG_SZ /d "usb_prank"  /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current"             /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"        /t REG_SZ /d "%prank_dir%\audio.wav"       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current"      /t REG_SZ /d "%prank_dir%\audio.wav"       /f

Set oWS = WScript.CreateObject("WScript.Shell")
sLinkFile = "C:\usb_prank\device_insert.lnk"
Set oLink = oWS.CreateShortcut(sLinkFile)
oLink.TargetPath = "C:\usb_prank\device_insert.bat"
oLink.Save

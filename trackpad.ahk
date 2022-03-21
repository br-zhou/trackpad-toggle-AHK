#SingleInstance Force

IniRead, touchpadEnabled, settings.ini,Main,Touchpad

if (touchpadEnabled = "ERROR") {
Run % "SystemSettingsAdminFlows.exe EnableTouchPad 1"
IniWrite, 1, settings.ini,Main,Touchpad
touchpadEnabled := 1
return
}

#`::
KeyWait, ``
Run % "SystemSettingsAdminFlows.exe EnableTouchPad " (touchpadEnabled := !touchpadEnabled)
IniWrite, %touchpadEnabled%, settings.ini,Main,Touchpad
return

#t::
KeyWait, t
Run % "SystemSettingsAdminFlows.exe EnableTouchPad " (touchpadEnabled := !touchpadEnabled)
IniWrite, %touchpadEnabled%, settings.ini,Main,Touchpad
return

!z:: ExitApp

; Inspired by this reddit post: shorturl.at/pGNUZ

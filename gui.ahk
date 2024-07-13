#Requires AutoHotkey v2.0

#Include ".\scripts\index.ahk"

global myGui, ih := InputHook("L1")

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
	myGui := Constructor()
	myGui.Show("w284 h203")
}

Constructor() {
  global myGui

  ; Define GUI
	myGui := Gui()
	myGui.Title := "Mattie's scripts"
	myGui.OnEvent('Close', (*) => ExitApp())

  ; Header + Seperator
	myGui.Add("Text", "x72 y0 w150 h25 +0x200", "Set a hotkey for each script")
	myGui.Add("Text", "x-8 y32 w312 h5 +0x10")

  forceClose()
  dropInv()
  prayFlick()
	
	return myGui
}

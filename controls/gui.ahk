﻿#Requires AutoHotkey v2.0

#Include ".\add_script.ahk"
#Include ".\debug_box.ahk"
#Include "..\scripts\index.ahk"

global myGui, ih := InputHook("L1"), scriptCount := 0

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
	myGui := Constructor()
	myGui.Show("w260")
}

Constructor() {
  global myGui

  ; Define GUI
	myGui := Gui()
	myGui.Title := "Mattie's scripts"
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.BackColor := "E2E2E2"

  ; Header + Seperator
	myGui.Add("Text", "x23", "Set a hotkey for each script you want to use")
	myGui.Add("Text", "x30 cRed", "Note:")
	myGui.Add("Text", "yp x59", "Don't forget to import runelite profile")
	myGui.Add("Text", "w240 x10 y+10 +0x10")

  ; Scripts
  addScript("Force Close", ExitApp)
  addScript("Get Color at Mouse", getColorAtMouse)
  addScript("Pray Flick", prayFlick)
  addScript("Slow Karams", karamCooking)
  addScript("Agility v1", agility)
  addScript("One Tick Click + Spacebar", oneTickClick)

  debugBox()
	
	return myGui
}

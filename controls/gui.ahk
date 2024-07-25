#Requires AutoHotkey v2.0

#Include ".\add_script.ahk"
#Include ".\debug_box.ahk"
#Include "..\scripts\index.ahk"

global myGui, ih := InputHook("L1"), currInputs := []

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
	myGui := Constructor()
	myGui.Show("w260")
}

Constructor() {
  global myGui, setupComplete

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
  
  tabs := myGui.Add("Tab3", "wp yp+12", ["Setup","General","Other"])
  myGui.Add("Text", "Section h0 w0", "")

  ; Setup
  tabs.UseTab(1)
  myGui.Add("Text", "xs ys w225", "Press setup to begin. Your RuneLite will automatically be pulled into focus. If you have more than one RuneLite open, it will default to the most recent.")1
  setupButton := myGui.Add("Button", "w55", "Setup")
  setupButton.OnEvent("Click", (*) =>
    setup()
    debug("Setup complete..")
  )
  
  ; General Scripts
  tabs.UseTab(2)
  addScript("Force Close", ExitApp, 0)
  for ind, script in generalScripts {
    addScript(script.name, script.fn, ind)
  }
  
  ; Other Scripts
  tabs.UseTab(3)
  for ind, script in otherScripts {
    addScript(script.name, script.fn, ind)
  }
  
  tabs.UseTab()
  debugBox()
	
	return myGui
}

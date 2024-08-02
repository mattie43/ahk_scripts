#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "..\scripts\index.ahk"
#Include ".\add_script.ahk"
#Include ".\add_multi_scripts.ahk"
#Include ".\debug_box.ahk"

global myGui, ih := InputHook("L1"), currInputs := [], maxWidth := 320, contentWidth := 300, tabWidth := 285, tabs := ""

setupText := "Import and select the runelite profile that comes with this library. Make sure you have Runelite open and are logged in. Make sure you are in Fixed - Classic layout. Press setup to begin. Your RuneLite will automatically be pulled into focus. If you have more than one RuneLite open, it will choose the most recently active."

hotkeyText := "To set a hotkey, press the GUI button, and then press a button on your keyboard (Space, Tab and Modifiers excluded). Pressing Esc will reset the selection."

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
	myGui := Constructor()
	myGui.Show("w" . maxWidth)
}

Constructor() {
  global myGui, tabs

  ; Define GUI
	myGui := Gui()
	myGui.Title := "Mattie's scripts"
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.BackColor := "E2E2E2"
  
  tabs := myGui.Add("Tab3", "h220 w" . contentWidth, ["Setup"])
  myGui.Add("Text", "Section h0 w0", "")

  ; Setup
  tabs.UseTab(1)
  myGui.Add("Text", "xs ys w" . tabWidth, setupText)
  setupButton := myGui.Add("Button", "w55", "Setup")
  setupButton.OnEvent("Click", (*) =>
    setup()
    debug("Setup complete..")
    addExtraTabs()
    setupButton.Opt("+Disabled")
  )
  ; Hotkey Text
  myGui.Add("Text", "w" . tabWidth, hotkeyText)
  ; Force Close
  addScript("Force Close Script", ExitApp, 5.3)

  addExtraTabs() {
    tabs.Add(["Basic","Advanced", "PvP"])

    ; Basic Scripts
    tabs.UseTab(2)
    addMultiScripts(basicScripts)
    
    ; Advanced Scripts
    tabs.UseTab(3)
    addMultiScripts(advancedScripts)
  
    ; PvP Scripts
    tabs.UseTab(4)
    myGui.Add("Text", "cRed w" . tabWidth, "THESE ARE WIP")
    for ind, script in pvpScripts {
      addScript(script.name, script.fn, ind)
    }
  }
  
  tabs.UseTab()
  debugBox()
	
	return myGui
}

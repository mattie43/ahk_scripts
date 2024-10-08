﻿#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "..\scripts\index.ahk"
#Include ".\add_script.ahk"
#Include ".\add_multi_scripts.ahk"
#Include ".\debug_box.ahk"
#Include ".\add_v2_scripts.ahk"
#Include ".\settings.ahk"

; f::{
;   ; game starts ~(7, 31)
;   MouseGetPos(&x, &y)
;   OutputDebug(x - 7 . ", " y - 31)
; }
; w:: {
;   MouseMove(0, -1, , "R")
; }
; a:: {
;   MouseMove(-1, 0, , "R")
; }
; s:: {
;   MouseMove(0, 1, , "R")
; }
; d:: {
;   MouseMove(1, 0, , "R")
; }

global myGui, ih := InputHook("L1"), currInputs := [], maxWidth := 320, contentWidth := 300, tabWidth := 285, tabs := ""

setupText := "Press setup to begin. Your RuneLite will automatically be pulled into focus. If you have more than one RuneLite open, it will choose the most recently active."

hotkeyText := "To set a hotkey, press the GUI button, and then press a button on your keyboard (Space, Tab and Modifiers excluded). Pressing Esc will reset the selection."

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
	myGui := Constructor()
  userSettings := settings.get()
  if (userSettings) {
    text := "x" . userSettings.guiX . " y" . userSettings.guiY . " w" . maxWidth
    myGui.Show(text)
  } else {
    myGui.Show("w" . maxWidth)
  }
}

Constructor() {
  global myGui, tabs

  ; Define GUI
	myGui := Gui()
	myGui.Title := "Mattie's scripts"

  closeApp(*) {
    myGui.GetPos(&x, &y, &w, &h)
    settings.set({
      guiX: x,
      guiY: y
    })
    ExitApp()
  }

	myGui.OnEvent('Close', closeApp)
	myGui.BackColor := "E2E2E2"
  
  tabs := myGui.Add("Tab3", "h190 w" . contentWidth, ["Setup"])
  myGui.Add("Text", "Section h0 w0", "")

  ; Setup
  tabs.UseTab(1)
  myGui.Add("Text", "xs ys w" . tabWidth, setupText)
  setupButton := myGui.Add("Button", "w95", "Setup Runelite")
  setupButton.OnEvent("Click", (*) =>
    setup()
    debug("Setup complete..")
    addExtraTabs()
    setupButton.Opt("+Disabled")
  )

  ; Hotkey Text
  myGui.Add("Text", "w" . tabWidth, hotkeyText)
  ; Force Close
  addScript("Force Close Script", closeApp, 4)

  addExtraTabs() {
    tabs.Add(["Basic","v1", "v2", "PvP"])

    ; Basic Scripts
    tabs.UseTab(2)
    addMultiScripts(basicScripts)
    
    ; v1 Scripts
    tabs.UseTab(3)
    addMultiScripts(v1Scripts)
    
    ; v2 Scripts
    tabs.UseTab(4)
    addV2Scripts()
  
    ; PvP Scripts
    tabs.UseTab(5)
    myGui.Add("Text", "cRed w" . tabWidth, "THESE ARE WIP")
    for ind, script in pvpScripts {
      addScript(script.name, script.fn, ind)
    }
  }
  
  tabs.UseTab()
  debugBox()
	
	return myGui
}

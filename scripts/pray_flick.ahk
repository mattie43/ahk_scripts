#Requires AutoHotkey v2.0

global prevInput := ""

prayFlickCallback() {
	Click()
	rand := Random(50, 90)
	Sleep(rand)
	Click()
}

v::Global stopLoop := True

prayFlick() {
  global myGui, ih, prevInput

  ; Create button
	button := myGui.Add("Button", "x56 y104 w80 h23", "&Null")
	myGui.Add("Text", "x144 y104 w80 h23 +0x200", "Pray Flick")
  button.OnEvent("Click", clickHandler)

  ; Click handler
  clickHandler(*) {
    button.Text := "..."
    ih.Stop()
    ih.KeyOpt("{Space}{Tab}", "I")
    ih.Start()
    ih.Wait()
    input := ih.Input
    ; If Esc, reset input
    if (Ord(input) == 27) {
      reset()
    } else {
      button.Text := StrUpper(input)
    }
    if (prevInput) {
      Hotkey(prevInput, "Off")
    }
    prevInput := input
    Hotkey(input, (*) => listenToColorChange(prayFlickCallback))
  }

  reset() {
    button.Text := "Null"
    if (prevInput) {
      Hotkey(prevInput, "Off")
    }
    prevInput := ""
    return
  }
}

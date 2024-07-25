#Requires AutoHotkey v2.0

addGeneralScript(name, onclick, scriptCount) {
  global myGui, ih, currInputs

  y := (scriptCount * 30)

  ; Create button
  button := myGui.Add("Button", "w55 xs ys" . y, "None")
  myGui.Add("Text", "xp+60 ys" . y+5, name)
  button.OnEvent("Click", clickHandler)

  ; Click handler
  clickHandler(*) {
    prevInput := button.Text
    button.Text := "..."
    ih.Stop()
    ih.KeyOpt("{Space}{Tab}", "I")
    ih.Start()
    ih.Wait()
    input := StrUpper(ih.Input)
    ; If Esc, reset text
    if (Ord(input) == 27) {
      button.Text := "None"
    } else if (hasVal(currInputs, input)) {
      exists(prevInput, input)
    } else {
      button.Text := input
      Hotkey(input, (*) => onclick(), "On")
      currInputs.Push(input)
    }
    checkReset(prevInput)
  }

  checkReset(prevInput) {
    ind := hasVal(currInputs, prevInput)
    if ind {
      Hotkey(prevInput, "Off")
      currInputs.RemoveAt(ind)
    }
  }

  exists(prevInput, input) {
    button.Text := prevInput
    MsgBox('Input "' . input . '" already exists.')
  }
}

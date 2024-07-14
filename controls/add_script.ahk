#Requires AutoHotkey v2.0

addScript(name, onclick) {
  global myGui, ih, prevInput, scriptCount

  y := (scriptCount * 35) + 40
  scriptCount += 1

  ; Create button
  button := myGui.Add("Button", "x10 y" . y . " w55 h25", "Null")
  myGui.Add("Text", "x70 y" . y+5, name)
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
    Hotkey(input, (*) => onclick())
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

#Requires AutoHotkey v2.0

addV2Scripts() {  
  global myGui, ih, currInputs
  
  scriptNames := []
  for ind, item in v2Scripts {
    scriptNames.Push(item.name)
  }

  ; Hotkey button
  v2btn := myGui.Add("Button", "xs ys w55", "None")
  v2btn.OnEvent("Click", handleHotkey)

  ; DDL of scripts
  v2ddl := myGui.Add("DropDownList", "Sort Choose1 yp w170", scriptNames)

  ; Setup button
  v2setup := myGui.Add("Button", "xs yp+30 w80", "Show Setup")
  v2setup.OnEvent("Click", handleSetup)

  handleHotkey(*) {
    prevInput := v2btn.Text
    v2btn.Text := "..."
    ih.Stop()
    ih.KeyOpt("{Space}{Tab}", "I")
    ih.Start()
    ih.Wait()
    input := StrUpper(ih.Input)
    ; If Esc, reset text
    if (Ord(input) == 27) {
      v2btn.Text := "None"
    } else if (hasVal(currInputs, input)) {
      exists(prevInput, input)
    } else {
      v2btn.Text := input
      Hotkey(input, (*) => checkCurrentScript(), "On")
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
    v2btn.Text := prevInput
    MsgBox('Input "' . input . '" already exists.')
  }

  checkCurrentScript(*) {
    foundItem := {}
    ddlText := v2ddl.Text
    
    for (ind, item in v2Scripts) {
      if (item.name == ddlText) {
        foundItem := item
      }
    }

    foundItem.run()
  }
  
  handleSetup(*) {
    foundItem := {}
    ddlText := v2ddl.Text
    
    for (ind, item in v2Scripts) {
      if (item.name == ddlText) {
        foundItem := item
      }
    }

    setupGui := Gui()
    setupGui.Title := "Setup"
    setupGui.OnEvent('Close', (*) => setupGui.Destroy())
    setupGui.BackColor := "E2E2E2"
    setupGui.Add("Picture", "", foundItem.setup_img)
    sText := StrSplit(foundItem.setup_text, "\n")
    for ind, text in sText {
      setupGui.Add("Text", "", ind . ": " . text)
    }
    setupGui.Show("w1055")
  }
}
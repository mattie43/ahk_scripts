#Requires AutoHotkey v2.0

addOtherScripts() {
  global myGui, ih, currInputs

  ; Get all script names
  scriptNames := []
  for ind, item in otherScripts {
    scriptNames.Push(item.name)
  }

  ; Hotkey for current selected script
  button := myGui.Add("Button", "w55", "None")
  button.OnEvent("Click", clickHandler)

  ; DDL of script names
  ddl := myGui.Add("DropDownList", "vColorChoice Sort Choose1 yp", scriptNames)
  ddl.OnEvent("Change", getDesc)
  
  ; Desc text
  descText := myGui.Add("Text", "w225 r8 xs ys+30 Wrap", "")

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
    button.Text := prevInput
    MsgBox('Input "' . input . '" already exists.')
  }

  getDesc(obj, _) {
    desc := ""
    objText := obj.Text
    for (ind, item in otherScripts) {
      if (item.name == objText) {
        desc := item.desc
      }
    }
    descText.Text := desc
  }

  checkCurrentScript(*) {    
    foundItem := {}
    ddlText := ddl.Text
    
    for (ind, item in otherScripts) {
      if (item.name == ddlText) {
        foundItem := item
      }
    }

    foundItem.fn()
  }

  getDesc(ddl, "")
}

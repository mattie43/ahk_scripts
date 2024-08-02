#Requires AutoHotkey v2.0

global basicEditBox := ""

addMultiScripts(scripts) {
  global myGui, ih, currInputs, tabs, basicEditBox

  ; Get all script names
  scriptNames := []
  for ind, item in scripts {
    scriptNames.Push(item.name)
  }

  ; Hotkey for current selected script
  button := myGui.Add("Button", "w55", "None")
  button.OnEvent("Click", clickHandler)

  ; DDL of script names
  ddl := myGui.Add("DropDownList", "Sort Choose1 yp w170", scriptNames)
  ddl.OnEvent("Change", getDesc)

  ; Drop Inv and X Ticks edit
  editBox := myGui.Add("Edit", "w100 r1", "")
  editBox.OnEvent("Change", updateEditBoxValue)
  
  ; Desc text
  descText := myGui.Add("Text", "w225 r8 xs ys+60 Wrap", "")

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
    for (ind, item in scripts) {
      if (item.name == objText) {
        desc := item.desc
      }
    }
    descText.Text := desc

    ; Show/Hide edit box for drop inv or clicking x ticks
    if (objText == "Drop Inventory" OR objText == "Click Every X Ticks") {
      editBox.Visible := True
      descText.Move(, 94)
    } else {
      editBox.Visible := False
      descText.Move(, 64)
    }
  }

  checkCurrentScript(*) {    
    foundItem := {}
    ddlText := ddl.Text
    
    for (ind, item in scripts) {
      if (item.name == ddlText) {
        foundItem := item
      }
    }

    foundItem.fn()
  }

  updateEditBoxValue(obj, _) {
    basicEditBox := obj.Text
  }

  getDesc(ddl, "")
}

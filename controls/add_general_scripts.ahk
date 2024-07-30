#Requires AutoHotkey v2.0

addGeneralScripts() {
  global dropInvSkips, myGui

  addScript("Force Close", ExitApp, 0)
  for ind, script in generalScripts {
    addScript(script.name, script.fn, ind)
  }

  myGui.Add("Text", "xs Wrap w225", 'Enter the inv slots you want to skip seperated by commas. Example: "1,2,3"')
  _edit := myGui.Add("Edit", "xs", "")
  _edit.OnEvent("Change", handleChange)

  handleChange(obj, _) {
    text := obj.Value
    dropInvSkips := StrSplit(text, ",")
  }
}
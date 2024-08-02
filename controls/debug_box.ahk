#Requires AutoHotkey v2.0

global myGui, listBox

debugBox() {
  global listBox, contentWidth

  time := FormatTime(A_Now, "HH:mm:ss")
  str := time . " - Starting GUI.."

  listBox := myGui.Add("ListBox", "x10 w" . contentWidth . " ReadOnly r10", [str])
}
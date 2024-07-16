#Requires AutoHotkey v2.0

global myGui, listBox

debugBox() {
  global listBox

  time := FormatTime(A_Now, "HH:mm:ss")
  str := time . " - Starting GUI.."

  listBox := myGui.Add("ListBox", "x10 w240 ReadOnly r10", [str])
}
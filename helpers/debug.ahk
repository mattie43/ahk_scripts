#Requires AutoHotkey v2.0

global listBox

debug(item) {
  time := FormatTime(A_Now, "HH:mm:ss")
  str := time . " - " . item
  listBox.Add([str])
}

outDebug(arr := []) {
  for ind, item in arr {
    OutputDebug(ind . ": " . item)
  }
}

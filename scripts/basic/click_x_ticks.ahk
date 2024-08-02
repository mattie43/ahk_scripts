#Requires AutoHotkey v2.0

clickXTicks() {
  global basicEditBox

  resetNum := RegExReplace(basicEditBox, "\D")
  
  if not (resetNum) {
    return MsgBox("Only select one number. Can not read number from given text: " . basicEditBox)
  }

  tickCount := 0

  callback() {
    if (tickCount == 1) {
      Click()
    }

    if (tickCount == resetNum) {
      tickCount := 0
    }

    tickCount += 1
  }

  listenToColorChange(callback, "click x ticks")
}

#Requires AutoHotkey v2.0

oneTickClick() {
  callback() {
    Send("{Space}")
    randSleep(130,160)
    Click()
  }

  listenToColorChange(callback)
}

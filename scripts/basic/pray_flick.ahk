#Requires AutoHotkey v2.0

prayFlick() {
  callback() {
    Click()
    rand := Random(90, 120)
    Sleep(rand)
    Click()
  }
  
  listenToColorChange(callback, "pray flick")
}

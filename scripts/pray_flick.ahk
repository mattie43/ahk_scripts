#Requires AutoHotkey v2.0

prayFlick() {
  prayFlickCallback() {
    Click()
    rand := Random(50, 90)
    Sleep(rand)
    Click()
  }
  
  listenToColorChange(prayFlickCallback)
}

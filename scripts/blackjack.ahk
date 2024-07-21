#Requires AutoHotkey v2.0

blackjack() {
  tickCount := 0
  callback() {
    if (tickCount == 1) {
      Click("Right")
      randSleep(100,130)
      Click()
    }
    if (tickCount == 2) {
      Click()
    }
    if (tickCount == 3) {
      Click()
      tickCount := 0
    }
    tickCount += 1
  }
  listenToColorChange(callback)
}

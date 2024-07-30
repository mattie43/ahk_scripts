#Requires AutoHotkey v2.0

alchCame() {
  tickCount := 0

  callback() {
    if (tickCount == 1) {
      clickColorIn(colors.orange, "inventory", 5)
      randSleep(50,90)
      Click()
    }
    if (tickCount == 2) {
      clickColorIn(colors.pink, "inventory", 5)
    }
    if (tickCount == 5) {
      tickCount := 0
    }
    tickCount += 1
  }

  listenToColorChange(callback, "alch camelot")
}
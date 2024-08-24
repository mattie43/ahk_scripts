#Requires AutoHotkey v2.0

alchCame() {
  tickCount := 0

  callback() {
    rand := Random(3,6)
    if (tickCount == 1) {
      if findImageIn(&x, &y, imgs.v1.high_alch, "inventory") {
        singleClick(x + rand, y + rand)
      }
      randSleep(50,90)
      Click()
    }
    if (tickCount == 2) {
      if findImageIn(&x, &y, imgs.v1.camelot_tele, "inventory") {
        singleClick(x + rand, y + rand)
      }
    }
    if (tickCount == 5) {
      tickCount := 0
    }
    tickCount += 1
  }

  listenToColorChange(callback, "alch camelot")
}
#Requires AutoHotkey v2.0

glassBlowing() {
  tickCount := 0

  callback() {
    if (tickCount == 1) {
      clickColorIn(colors.pink, "game", 6)
    }
    if (tickCount == 2) {
      clickInventory(2)
      randSleep(120,150)
      if not clickImageIn(imgs.v1.molten_glass, "game", 3, 3, 4) {
        debug("Can not find molten glass, stopping..")
        return stopLooping()
      }
      randSleep(120,150)
      Send("{Esc}")
    }
    if (tickCount == 4) {
      clickInventory(1)
      randSleep(90,120)
      clickInventory(5)
    }
    if (tickCount == 5) {
      Send("{Space}")
    }
    if (tickCount == 87) {
      randSleep(0,2000)
      tickCount := 0
    }

    tickCount += 1
  }

  listenToColorChange(callback, "glass blowing")
}
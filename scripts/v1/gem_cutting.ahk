#Requires AutoHotkey v2.0

gemCutting() {
  tickCount := 0

  callback() {
    if (tickCount == 1) {
      clickColorIn(colors.pink, "game", 6)
    }
    if (tickCount == 2) {
      clickInventory(2)
      randSleep(120,150)
      clickColorIn(colors.off_cyan, "game", 6)
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
    if (tickCount == 60) {
      tickCount := 0
    }

    tickCount += 1
  }

  listenToColorChange(callback, "gem cutting")
}
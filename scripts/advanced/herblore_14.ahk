#Requires AutoHotkey v2.0

herblore14() {
  tickCount := 0

  callback() {
    if (tickCount == 1) {
      clickColorIn(colors.pink, "game", 6)
    }
    if (tickCount == 2) {
      depositAll()
      randSleep(120,150)
      clickColorIn(colors.off_cyan, "game", 6)
      randSleep(120,150)
      clickColorIn(colors.orange, "game", 6)
      randSleep(120,150)
      Send("{Esc}")
    }
    if (tickCount == 4) {
      clickInventory(13)
      randSleep(90,120)
      clickInventory(17)
    }
    if (tickCount == 5) {
      Send("{Space}")
    }
    if (tickCount == 33) {
      tickCount := 0
    }

    tickCount += 1
  }

  listenToColorChange(callback, "herblore 14")
}
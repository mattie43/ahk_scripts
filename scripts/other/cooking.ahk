#Requires AutoHotkey v2.0

cooking() {
  tickCount := 0

  callback() {
    ; bank
    if (tickCount == 1) {
      clickColorIn(colors.pink, "game")
    }
    if (tickCount == 2) {
      depositAll()
    }
    if (tickCount == 3) {
      clickColorIn(colors.off_cyan, "game")
      randSleep(50,100)
      Send("{Esc}")
    }
    ; fire/range
    if (tickCount == 4) {
      clickColorIn(colors.orange, "game")
    }
    if (tickCount == 5) {
      Send("{Space}")
    }
    if (tickCount > 12 AND findImageIn(&_, &_, imgs.not_cooking, "game")) {
      rand := Random(1,5)
      debug('rand: ' . rand) 
      if (rand == 1) {
        tickCount := 0
      }
    }

    tickCount += 1
  }

  listenToColorChange(callback, "cooking")
}

#Requires AutoHotkey v2.0

oneTickCooking() {
  tickCount := 0
  oneTickCycleCount := 0

  callback() {
    ; RESET TICK CYCLE
    if (oneTickCycleCount == 30) {
      tickCount := 0
      oneTickCycleCount := 0
      return
    }

    ; 1 TICK CYCLE
    if (oneTickCycleCount > 0) {
      clickInventory(28)
      Send("{Space}")
      randSleep(50,90)
      clickColorIn(colors.orange, "game")
      Send("{Space}")
      randSleep(100,130)
      Send("{Space}")
      oneTickCycleCount += 1
      return
    }

    ; BANKING
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
      oneTickCycleCount += 1
    }

    tickCount += 1
  }

  listenToColorChange(callback, "1 tick cooking")
}
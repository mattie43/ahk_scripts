#Requires AutoHotkey v2.0

smithing() {
  tickCount := 0
  furnaceSleep := 0

  callback() {
    ; Click furnace
    if (tickCount == 1) {
      ; randomize furnace sleeping, 144 min
      furnaceSleep := Random(144,149)
      if not clickColorIn(colors.orange, "game", 4) {
        debug("cant find furnace")
      }
    }
    ; Start gold bars
    if (tickCount == 10) {
      Send("{Space}")
    }
    ; Click bank
    if (tickCount == furnaceSleep + 9) {
      clickColorIn(colors.pink, "game", 4)
    }
    ; Deposit all, take out ores, close Bank
    if (tickCount == furnaceSleep + 18) {
      depositAll()
      if findImageIn(&x, &y, imgs.gold_ore, "game") {
        singleClick(x + 3, y + 3, 5)
      } else {
        debug("Can not find gold ore in bank..")
        return stopLooping()
      }
      randSleep(70,100)
      Send("{Esc}")
      tickCount := 0
    }

    tickCount += 1
  }

  listenToColorChange(callback, "smithing")
}
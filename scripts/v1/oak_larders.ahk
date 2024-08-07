#Requires AutoHotkey v2.0

global tickCount := 0

oakLarders() {
  callback() {
    global tickCount

    x := -1
    y := -1

    tableClickTicks := [1,4,7,10,13,16]
    buildTicks := [2,8,14]
    removeTicks := [5,11,17]
    butlerTick := 19

    if (hasVal(tableClickTicks, tickCount)) {
      clickColorIn(colors.pink, "game", 5)
    }
    if (hasVal(buildTicks, tickCount)) {
      Send("2")
    }
    if (hasVal(removeTicks, tickCount)) {
      Send("1")
    }
    if (tickCount == butlerTick) {
      clickColorIn(colors.off_cyan, "game", 3)
    }
    if (tickCount == butlerTick + 1) {
      Send("1")
    }
    if (tickCount > 10) {
      if ImageSearch(&x, &y, window.chat.x, window.chat.y, window.chat.x + window.chat.width, window.h, imgs.v1.demon_butler_retrieve) {
        tickCount := 0
      }
    }

    tickCount += 1
  }
  
  listenToColorChange(callback, "oak larders")
}

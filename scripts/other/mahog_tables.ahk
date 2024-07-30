#Requires AutoHotkey v2.0

global tickCount := 0

mahogTables() {
  callback() {
    global tickCount

    x := -1
    y := -1

    tableClickTicks := [1,4,7,10,13,16,19,22]
    buildTicks := [2,8,14,20]
    removeTicks := [5,11,17,23]
    butlerTick := 25

    if (hasVal(tableClickTicks, tickCount)) {
      clickColorIn(colors.pink, "game", 5)
    }
    if (hasVal(buildTicks, tickCount)) {
      Send("6")
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
      if findImageIn(&_, &_, imgs.demon_butler_retrieve, "chat") {
        tickCount := 0
      }
    }

    tickCount += 1
  }
  
  listenToColorChange(callback, "mahog tables")
}

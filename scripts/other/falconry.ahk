#Requires AutoHotkey v2.0

falconry() {
  tickCount := 0
  droppingInv := False
  lastClickOrange := False

  topLeft := {
    x: window.game.x,
    y: window.game.y
  }
  bottomRight := {
    x: window.game.x + window.game.width,
    y: window.game.y + window.game.height
  }

  callback() {
    if (droppingInv) {
      return
    }

    if (Mod(tickCount, 4) == 0) {
      rand := Random(8,10)

      oraCoords := getColorTopLeft(topLeft, bottomRight, colors.orange)
      cyanCoords := getColorTopLeft(topLeft, bottomRight, colors.off_cyan)

      if (oraCoords.x != -1) {
        lastClickOrange := True
        singleClick(oraCoords.x + rand, oraCoords.y + rand)
      } else if (cyanCoords.x != -1) {
        if (lastClickOrange) {
          droppingInv := True
          dropInventory([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28])
          lastClickOrange := False
          return droppingInv := False
        }
        singleClick(cyanCoords.x + rand, cyanCoords.y + rand)
      }
    }

    tickCount += 1
  }

  listenToColorChange(callback, "falconry")
}
#Requires AutoHotkey v2.0

falconry() {
  tickCount := 0
  droppingInv := False
  lastClickOrange := False

  tl := {
    x: window.game.x,
    y: window.game.y
  }
  br := {
    x: window.game.x + window.game.width,
    y: window.game.y + window.game.height
  }

  callback() {
    if (droppingInv) {
      return
    }

    if (Mod(tickCount, 4) == 0) {
      rand := Random(8,12)

      if getColorTopLeft(&orangeX, &orangeY, tl, br, colors.orange) {
        lastClickOrange := True
        singleClick(orangeX + rand, orangeY + rand)
      } else if getColorTopLeft(&cyanX, &cyanY, tl, br, colors.off_cyan) {
        if (lastClickOrange) {
          droppingInv := True
          dropInventory([5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28])
          lastClickOrange := False
          return droppingInv := False
        }
        singleClick(cyanX + rand, cyanY + rand)
      }
    }

    tickCount += 1
  }

  listenToColorChange(callback, "falconry")
}
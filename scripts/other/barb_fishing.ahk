#Requires AutoHotkey v2.0

barbFishing() {
  droppingInv := False
  walking := False

  callback() {
    ; dropping inv
    if (droppingInv OR walking) {
      return
    }

    ; full inv
    if (findImageIn(&_, &_, imgs.anymore_fish, "chat")) {
      droppingInv := True
      dropInventory([1,2])
      droppingInv := False
    }

    ; not fishing
    if (findImageIn(&_, &_, imgs.not_fishing, "game")) {
      tl := {
        x: window.game.x,
        y: window.game.y
      }

      br := {
        x: window.game.x + window.game.width,
        y: window.game.y + window.game.height
      }

      if getColorTopLeft(&x, &y, tl, br, colors.off_cyan) {
        walking := True
        singleClick(x + 20, y + 20, 5)
        SetTimer((*) => walking := False, -5000)
      }
    }
  }

  listenToColorChange(callback, "barb fishing")
}

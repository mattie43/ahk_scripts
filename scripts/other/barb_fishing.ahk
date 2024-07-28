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
    if (findImageIn(&_, &_, imgs.anymore_fish, "chat", 0, 0)) {
      droppingInv := True
      dropInventory([1,2])
      droppingInv := False
    }

    ; not fishing
    if (findImageIn(&_, &_, imgs.not_fishing, "game", 0, 0)) {
      topLeft := {
        x: window.game.x,
        y: window.game.y
      }

      bottomRight := {
        x: window.game.x + window.game.width,
        y: window.game.y + window.game.height
      }

      coords := getColorTopLeft(topLeft, bottomRight, colors.off_cyan)

      if (coords.x == -1) {
        return
      }

      walking := True
      singleClick(coords.x + 20, coords.y + 20, 5)
      SetTimer((*) => walking := False, -5000)
    }
  }

  listenToColorChange(callback, "barb fishing")
}

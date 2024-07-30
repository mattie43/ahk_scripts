#Requires AutoHotkey v2.0

stallStealer() {
  stealing := False
  droppingInv := False

  callback() {
    if (droppingInv) {
      return
    }

    if (findImageIn(&_, &_, imgs.inventory_full, "chat", 0, 0)) {
      droppingInv := True
      dropInventory()
      return droppingInv := False
    }

    if (stealing) {
      return stealing := False
    }

    if findColorIn(&x, &y, colors.pink, "game") {
      stealing := True
      singleClick(coords.x, coords.y, 5)
    }
  }

  listenToColorChange(callback, "stall stealer")
}
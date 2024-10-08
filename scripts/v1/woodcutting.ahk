#Requires AutoHotkey v2.0

woodcutting() {
  prevColorCoords := { x: -1, y: -1 }
  droppingInv := False
  tl := { x: window.game.x, y: window.game.y }
  br := { x: tl.x + window.game.width, y: tl.y + window.game.height }
  tlChat := { x: 12, y: 465 }
  brChat := { x: 316, y: 487 }

  callback() {
    if (droppingInv) {
      return
    }
    if not isInvSlotEmpty(28) {
      droppingInv := True
      randSleep(100,2000)
      dropInventory([1])
      prevColorCoords := { x: -1, y: -1 }
      droppingInv := False
    }

    if not getColorTopLeft(&cx, &cy, tl, br, colors.pink) {
      return
    }

    if (cy == prevColorCoords.y) {
      return
    } else {
      rand := Random(20,40)
      singleClick(cx + rand, cy + rand)
      prevColorCoords.x := cx
      prevColorCoords.y := cy
    }
  }

  listenToColorChange(callback, "woodcutting")
}
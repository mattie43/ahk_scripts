#Requires AutoHotkey v2.0

invFullImg := "..\imgs\inventory_full.png"

ironPowerMine() {
  prevColorCoords := { x: -1, y: -1 }
  droppingInv := False

  callback() {
    if (droppingInv) {
      return
    } else if ImageSearch(&_, &_, window.chat.x, window.chat.y, window.chat.x + window.chat.width, window.h, invFullImg) {
      droppingInv := True
      randSleep(100,5000)
      dropInventory()
      prevColorCoords := { x: -1, y: -1 }
      droppingInv := False
    }

    tl := { x: window.game.x, y: window.game.y }
    br := { x: tl.x + window.game.width, y: tl.y + window.game.height }

    colorCoords := getColorTopLeft(tl, br, colors.pink)

    if (colorCoords.x == -1 OR colorCoords.y == -1) {
      return
    }

    if (colorCoords.y == prevColorCoords.y) {
      return
    } else {
      rand := Random(10,50)
      singleClick(colorCoords.x + rand, colorCoords.y + rand)
      prevColorCoords := colorCoords
    }
  }

  listenToColorChange(callback)
}
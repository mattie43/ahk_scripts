#Requires AutoHotkey v2.0

invFullImg := "*50 ..\imgs\inventory_full.png"

stallThieving() {
  tickCount := 0
  droppingInv := False
  sq := findColorIn(colors.pink, "game")
  location := { x: -1 , y: -1 }

  resetLocation() {
    rand := Random(-5, 5)
    location.x := sq.x + rand
    location.y := sq.y + rand
    MouseMove(location.x, location.y)
  }

  callback() {
    if (droppingInv) {
      return
    }

    imageAt := findImageIn(invFullImg, "chat")

    if (imageAt.x != -1) {
      droppingInv := True
      randSleep(100,2000)
      dropInventory()
      resetLocation()
      droppingInv := False
    }

    if (tickCount == 1) {
      Click()
    }
    if (tickCount == 5) {
      tickCount := 0
    }

    tickCount += 1
  }

  resetLocation()
  listenToColorChange(callback)
}
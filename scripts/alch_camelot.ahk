#Requires AutoHotkey v2.0

alchCamelot() {
  tickCount := 0
  pink_sq := findColorIn(colors.pink, "inventory")
  orange_sq := findColorIn(colors.orange, "inventory")
  
  callback() {
    rand_sq := Random(-5, 5)
  
    if (tickCount == 1) {
      Click(pink_sq.x + rand_sq, pink_sq.y + rand_sq)
      randSleep(90, 120)
      Click(pink_sq.x + rand_sq, pink_sq.y + rand_sq)
    }
    if (tickCount == 2) {
      Click(orange_sq.x + rand_sq, orange_sq.y + rand_sq)
    }
    if (tickCount > 4) {
      tickCount := 0
    }
  
    tickCount += 1
  }

  listenToColorChange(callback)
}

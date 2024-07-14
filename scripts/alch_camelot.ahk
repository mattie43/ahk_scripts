#Requires AutoHotkey v2.0

#Include ".\index.ahk"

global tickCount := 0

callback() {
  global tickCount

  pink_sq := findColorIn(colors.pink, "inventory")
  orange_sq := findColorIn(colors.orange, "inventory")
  rand_sq := Random(-5, 5)

  if (tickCount == 1) {
    Click(pink_sq.x + rand_sq, pink_sq.y + rand_sq)
    rand := Random(50, 90)
    Sleep(rand)
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

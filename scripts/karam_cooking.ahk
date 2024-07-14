#Requires AutoHotkey v2.0

#Include "..\helpers\index.ahk"

karamCooking() {
  clickInventory(28)
  Sleep(100)
  coords := findColorIn(colors.pink, "game")
  Click(coords.x, coords.y)
}

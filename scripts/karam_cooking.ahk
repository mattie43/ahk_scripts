#Requires AutoHotkey v2.0

global tickCount := 0

karamCooking() {
  callback() {
    global tickCount

    SendInput("{Space}")
    clickInventory(28)
    Sleep(100)
    SendInput("{Space}")
    coords := findColorIn(colors.pink, "game")
    rand := Random(-10, 10)
    MouseMove(coords.x + rand, coords.y + rand)
    Sleep(50)
    SendInput("{Space}")
    Click()
    SendInput("{Space}")

    tickCount += 1 
  }
  
  listenToColorChange(callback)
}

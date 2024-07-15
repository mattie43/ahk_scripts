#Requires AutoHotkey v2.0

karam_img := "..\imgs\raw_karambwan.png"

global tickCount := 0

karamCooking() {
  callback() {
    global tickCount, isLooping

    if (tickCount == 1) {
      clickColorIn(colors.pink, "game")
    }
    if (tickCount == 2) {
      depositAll()
    }
    if (tickCount == 3) {
      x := -1
      y := -1
      
      if ImageSearch(&x, &y, 0, 0, window.w, window.h, karam_img) {
        singleClick(x, y, 3)
      } else {
        MsgBox("Failed to find karambwan")
        ExitApp
      }
      randSleep(50, 80)
      Send("{Esc}")
    }
    if (tickCount == 4) {
      clickColorIn(colors.orange, "game")
    }
    if (tickCount == 5) {
      Send("{Space}")
    }
    if (tickCount > 112) {
      return tickCount := 0
    }

    tickCount += 1 
  }
  
  listenToColorChange(callback)
}

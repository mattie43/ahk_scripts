#Requires AutoHotkey v2.0

global isLooping := False

agility(){
  global isLooping
  tickCount := 0
  stepCount := 0
  currentStep := "moving"

  getMog() {
    currentStep := "skipping"
    Sleep(600)
    clickColorIn(colors.orange, "game", 1)
    Loop(10) {
      if not findColorIn(&_, &_, colors.orange, "game") {
        break
      }
      Sleep(600)
    }
    currentStep := "click_tile"
  }

  mogCheck() {
    if findColorIn(&mx, &my, colors.orange, "game") {
      p := window.player.x + window.player.y
      m := mx + my
  
      check := Abs(p - m)
  
      if (check < 50) {
        getMog()
        return True
      }
    }
    return False
  }

  delayMoving() {
    tickCount := 0
    currentStep := "skipping"
    SetTimer((*) => currentStep := "moving", -2000)
  }

  clickNextColor() {
    ; mog first?
    if mogCheck() {
      return
    }

    ; try for next pink in step count?
    if (stepCount > 0) {
      if clickColorIn(colors.pinks[stepCount], "game", 1) {
        delayMoving()
        debug("click on step: " . stepCount)
        return stepCount += 1
      }
    }
    
    ; try for yellow reset tile?
    if clickColorIn(colors.yellow, "game", 1) {
      delayMoving()
      debug("click on yellow")
      return stepCount := 1
    }

    ; try to reset pinks?
    for ind, item in colors.pinks {
      if clickColorIn(item, "game", 1) {
        delayMoving()
        debug("click on new pink: " . ind)
        stepCount := ind + 1
        break
      }
    }
  }

  checkPlayerTile() {
    if (playerInTile(colors.yellow, 6) OR playerInTile(colors.off_cyan, 6)) {
      debug("player in yellow  or blue tile")
      return currentStep := "click_tile"
    }
  }

  callback(){
    if (currentStep == "skipping") {
      return
    }
    if (currentStep == "moving") {
      return checkPlayerTile()
    }
    if (currentStep == "click_tile") {
      return clickNextColor()
    }
    
    ; Check for idling too long
    tickCount += 1
    if (tickCount > 50) {
      isLooping := False
      debug("Failed to find next color. Stopping script..")
      debug("Last known step: " . currentStep)
    }
  }

  listenToColorChange(callback, "agility")
}
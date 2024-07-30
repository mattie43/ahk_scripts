#Requires AutoHotkey v2.0

global isMoving := False

agility(){
  global isMoving

  mogCheck() {
    if not findColorIn(&mx, &my, colors.orange, "game") {
      return
    }

    p := window.player.x + window.player.y
    m := mx + my

    check := Abs(p - m)

    if (check < 50) {
      singleClick(mog.x, mog.y)
      Loop(10) {
        if not findColorIn(&_, &_, colors.orange, "game") {
          break
        }
        Sleep(600)
      }
    }
  }

  fallCheck(){
    if (playerInTile(colors.off_red)) {
      isMoving := True
      clickColorIn(colors.off_cyan, "game", 5)
      SetTimer((*) => isMoving := False, -2000)   
    }
  }

  callback(){
    if (isMoving) {
      return
    }
    
    fallCheck()

    if (playerInTile(colors.off_cyan)) {
      mogCheck()
      isMoving := True
      clickColorIn(colors.pink, "game", 4)
      SetTimer((*) => isMoving := False, -2000)
    }
  }

  listenToColorChange(callback)
}
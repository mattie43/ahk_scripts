#Requires AutoHotkey v2.0

global isMoving := False

agility(){
  global isMoving

  mogCheck() {
    playerX := window.player.x
    playerY := window.player.y
    mog := findColorIn(colors.orange, "game")

    p := playerX + playerY
    m := mog.x + mog.y

    check := Abs(p - m)

    if (check < 50) {
      singleClick(mog.x, mog.y)
      Loop(10) {
        mog := findColorIn(colors.orange, "game")
        if (mog.x == -1) {
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
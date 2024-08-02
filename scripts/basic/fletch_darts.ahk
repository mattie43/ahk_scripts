#Requires AutoHotkey v2.0

fletchDarts() {
	global isLooping

  if (isLooping) {
    debug("Stopping fletch darts..")
    return isLooping := False
  } else {
    debug("Starting fletch darts..")
    isLooping := True
  }

  Loop {
    if (!isLooping) {
      break
    }
    clickInventory(1)
    randSleep(10,20)
    clickInventory(1)
    randSleep(10,20)
    clickInventory(2)
    randSleep(10,20)
    clickInventory(2)
    randSleep(10,20)
  }
}
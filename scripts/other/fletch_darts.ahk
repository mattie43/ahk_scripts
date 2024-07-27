#Requires AutoHotkey v2.0

fletchDarts() {
	global isLooping

  if (isLooping) {
    return isLooping := False
  } else {
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
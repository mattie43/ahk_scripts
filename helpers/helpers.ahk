#Include ".\index.ahk"
#MaxThreadsPerHotkey 2

global isLooping := False

getColorCenter(topLeft, bottomRight, color) {
	topLeftX := -1
	topLeftY := -1
	bottomRightX := -1
	bottomRightY := -1
	
	; Search top left to bottom right
	if !PixelSearch(&topLeftX, &topLeftY, topLeft.x, topLeft.y, bottomRight.x, bottomRight.y, color, 0) {
    return { x: -1, y:-1 }
		; MsgBox "Could not find pixel: " . color
		; ExitApp
	}
	
	; Search bottom right to top left
	if !PixelSearch(&bottomRightX, &bottomRightY, bottomRight.x, bottomRight.y, topLeft.x, topLeft.y, color, 0) {
    return { x: -1, y:-1 }
		; MsgBox "Could not find pixel: " . color
		; ExitApp
	}
	
	
	centerX := Floor((topLeftX + bottomRightX) / 2)
	centerY := Floor((topLeftY + bottomRightY) / 2)
	
	coords := {}
	coords.x := centerX
	coords.y := centerY
	
	return coords
}

selectTab(tab) {
  rand := Random(-10, 10)
	MouseMove(window.tabs.%tab%.x + rand, window.tabs.%tab%.y + rand)
  Click()
}

findColorIn(color, section) {
	chosenSection := {}
	
	if section == "game"
	{
		chosenSection := window.game
	}
	else if section == "chat"
	{
		chosenSection := window.chat
	}
	else
	{
		chosenSection := window.inventory
	}
	
	topLeft := {
		x: chosenSection.x,
		y: chosenSection.y
	}
	bottomRight := {
		x: chosenSection.x + chosenSection.width,
		y: chosenSection.y + chosenSection.height
	}
	
	coords := getColorCenter(topLeft, bottomRight, color)
	return coords
}

clickColorIn(color, section, rand := 0) {
  coords := findColorIn(color, section)
  singleClick(coords.x, coords.y, rand)
}

depositAll() {
  singleClick(window.bank.deposit.x, window.bank.deposit.y, 7)
}

singleClick(x := -1, y:= -1, rand := 0) {
  if (x < 1 OR y < 1) {
    return
  }
  if (rand > 0) {
    rand := Random(rand * -1, rand)
  }
  if (x AND y) {
    MouseMove(x + rand, y + rand)
  }
  randSleep(90, 130)
  Click()
}

doubleClick(x := -1, y:= -1, rand := 0) {
  if (x < 1 OR y < 1) {
    return
  }
  if (rand > 0) {
    rand := Random(rand * -1, rand)
  }
  if (x AND y) {
    MouseMove(x + rand, y + rand)
  }
  randSleep(90, 130)
  Click()
  randSleep(90, 130)
  Click()
}

randSleep(x, y) {
  rand := Random(x, y)
  Sleep(rand)
}

getTickColor() {
	return PixelGetColor(window.tick_counter.x, window.tick_counter.y)
}

listenToColorChange(callback) {
	global isLooping
	startColor := getTickColor()

  if (isLooping) {
    return isLooping := False
  } else {
    isLooping := True
  }
	
	Loop
	{
		if (!isLooping) {
			break
		}
		currColor := getTickColor()
		if (startColor != currColor) {
			startColor := currColor
			callback()
		}
	}
}

dropInventory(skip:=[]) {
  Send("{Shift down}")
  randSleep(70, 100)
  for ind, inv in window.inventory.slots {
    if hasVal(skip, ind) {
      continue
    }
    rand := Random(-5, 5)
    Click(inv.x + rand, inv.y + rand)
    randSleep(100, 130)
  }
  Send("{Shift up}")
}

hasVal(arr, item) {
  for index, val in arr
    if (val == item) {
      return index
    }
  return 0
}

clickInventory(num) {
  x := window.inventory.slots[num].x
  y := window.inventory.slots[num].y
  rand := Random(-5, 5)
  Click(x + rand, y + rand)
}

playerInTile(color) {
  playerX := window.player.x
  playerY := window.player.y
  
  playerColor := PixelGetColor(playerX, playerY)

  if (playerColor == color) {
    return True
  }
  return False
}

debug(arr := []) {
  for ind, item in arr {
    OutputDebug(ind . ": " . item)
  }
}

/*
#HotIf WinActive("YourWindowTitle")
~Esc::x := y
#HotIf
*/

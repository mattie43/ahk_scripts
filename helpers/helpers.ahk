#Include ".\index.ahk"
#MaxThreadsPerHotkey 2

global isLooping := False

getColorTopLeft(topLeft, bottomRight, color) {
  x := -1
  y := -1

  if not (PixelSearch(&x, &y, topLeft.x, topLeft.y, bottomRight.x, bottomRight.y, color, 0)) {
    return { x: -1, y: -1 }
  }
  
  return { x: x, y: y }
}

getColorBottomRight(topLeft, bottomRight, color) {
  x := -1
  y := -1

	if not (PixelSearch(&x, &y, bottomRight.x, bottomRight.y, topLeft.x, topLeft.y, color, 0)) {
    return { x: -1, y: -1 }
  }

  return { x: x, y: y }
}

getColorCenter(topLeft, bottomRight, color) {	
	; Search top left to bottom right
	tl := getColorTopLeft(topLeft, bottomRight, color)
	
	; Search bottom right to top left
	br := getColorBottomRight(topLeft, bottomRight, color)
	
  return {
    x: Floor((tl.x + br.x) / 2),
    y: Floor((tl.y + br.y) / 2)
  }
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

findImageIn(image, section) {
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
	
	tl := {
		x: chosenSection.x,
		y: chosenSection.y
	}
	br := {
		x: chosenSection.x + chosenSection.width,
		y: chosenSection.y + chosenSection.height
	}
	
	if (ImageSearch(&x, &y, tl.x, tl.y, br.x, br.y, image)) {
    return { x: x, y: y}
  } else {
    return { x: -1, y: -1}
  }
}

clickColorIn(color, section, rand := 0) {
  coords := findColorIn(color, section)
  singleClick(coords.x, coords.y, rand)
}

clickRandomColorIn(color, section) {
	chosenSection := {}
	
	if section == "game" {
		chosenSection := window.game
	} else if section == "chat" {
		chosenSection := window.chat
	}	else {
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
  
  tl := getColorTopLeft(topLeft, bottomRight, color)
  br := getColorBottomRight(topLeft, bottomRight, color)

  randX := Random(tl.x + 1, br.x - 1)
  randY := Random(tl.y + 1, br.y - 1)

  singleClick(randX, randY)
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
  singleClick(x, y, 5)
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

/*
#HotIf WinActive("YourWindowTitle")
~Esc::x := y
#HotIf
*/

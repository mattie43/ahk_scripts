#Include ".\index.ahk"

getColorCenter(topLeft, bottomRight, color) {
	topLeftX := -1
	topLeftY := -1
	bottomRightX := -1
	bottomRightY := -1
	
	; Search top left to bottom right
	if !PixelSearch(&topLeftX, &topLeftY, topLeft.x, topLeft.y, bottomRight.x, bottomRight.y, color, 0)
	{
		MsgBox "Could not find pixel: " . color
		ExitApp
	}
	
	; Search bottom right to top left
	if !PixelSearch(&bottomRightX, &bottomRightY, bottomRight.x, bottomRight.y, topLeft.x, topLeft.y, color, 0)
	{
		MsgBox "Could not find pixel: " . color
		ExitApp
	}
	
	
	centerX := (topLeftX + bottomRightX) / 2
	centerY := (topLeftY + bottomRightY) / 2
	
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

findColorIn(color, type) {
	chosenType := {}
	
	if type == "game"
	{
		chosenType := window.game
	}
	else if type == "chat"
	{
		chosenType := window.chat
	}
	else
	{
		chosenType := window.inventory
	}
	
	topLeft := {
		x: chosenType.x,
		y: chosenType.y
	}
	bottomRight := {
		x: chosenType.x + chosenType.width,
		y: chosenType.y + chosenType.height
	}
	
	coords := getColorCenter(topLeft, bottomRight, color)
	return coords
}

getTickColor() {
	return PixelGetColor(window.tick_counter.x, window.tick_counter.y)
}

listenToColorChange(callback) {
	Global stopLoop := False
	startColor := getTickColor()
	
	Loop
	{
		if (stopLoop)
		{
			break
		}
		currColor := getTickColor()
		if (startColor != currColor)
		{
			startColor := currColor
			callback()
		}
	}
}

dropInventory(skip:=[]) {
  Send("{Shift down}")
  Sleep(100)
  for ind, inv in window.inventory.slots {
    if hasVal(skip, ind) {
      continue
    }
    rand := Random(-5, 5)
    Click(inv.x + rand, inv.y + rand)
    Sleep(Random(50, 100))
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

/*
#HotIf WinActive("YourWindowTitle")
~Esc::stopLoop := true
#HotIf
*/

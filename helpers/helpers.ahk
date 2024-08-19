#MaxThreadsPerHotkey 2

global isLooping := False

getColorTopLeft(&x, &y, tl, br, color) {
	; Search top left to bottom right
  return PixelSearch(&x, &y, tl.x, tl.y, br.x, br.y, color, 0)
}

getColorBottomRight(&x, &y, tl, br, color) {
	; Search bottom right to top left
	return PixelSearch(&x, &y, br.x, br.y, tl.x, tl.y, color, 0)
}

getColorCenter(&cx, &cy, tl, br, color) {
	_tl := getColorTopLeft(&tlx, &tly, tl, br, color)
	
	_br := getColorBottomRight(&brx, &bry, tl, br, color)

  if (tlx AND tly AND brx AND bry) {
    cx := Floor((tlx + brx) / 2)
    cy := Floor((tly + bry) / 2)
  }
  
  return _tl AND _br
}

selectTab(tab) {
  singleClick(window.tabs.%tab%.x, window.tabs.%tab%.y, 10)
}

findColorIn(&x, &y, color, section) {
	chosenSection := {}
	
	if section == "game" {
		chosenSection := window.game
	}	else if section == "chat"	{
		chosenSection := window.chat
	}	else {
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
	
	return getColorCenter(&x, &y, tl, br, color)
}

findImageIn(&x, &y, image, section) {
	chosenSection := {}
	
	if section == "game" {
		chosenSection := window.game
	}	else if section == "chat"	{
		chosenSection := window.chat
	}	else {
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
	
	return ImageSearch(&x, &y, tl.x, tl.y, br.x, br.y, image)
}

clickColorIn(color, section, rand := 0) {
  if findColorIn(&x, &y, color, section) {
    singleClick(x, y, rand)
    return True
  } else {
    return False
  }
}

clickImageIn(image, section, width := 0, height := 0, rand := 0) {
  if findImageIn(&x, &y, image, section) {
    singleClick(x + width, y + height, rand)
    return True
  } else {
    return False
  }
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

listenToColorChange(callback, name := "") {
	global isLooping
	startColor := getTickColor()

  if (isLooping) {
    if (name) {
      debug("Stopping " . name . "..")
    }
    return isLooping := False
  } else {
    if (name) {
      debug("Starting " . name . "..")
    }
    activateRunelite()
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
    Click(inv.cx + rand, inv.cy + rand)
    randSleep(100, 130)
  }
  Send("{Shift up}")
}

hasVal(arr, item) {
  if (arr AND item) {
    for index, val in arr {
      if (val == item) {
        return index
      }
    }
  }
  return 0
}

clickInventory(num) {
  x := window.inventory.slots[num].cx
  y := window.inventory.slots[num].cy
  singleClick(x, y, 5)
}

/*
  Only covers bank slots 1 and 2 atm.
*/
clickBankSlot(num) {
  x := window.bank.slots[num].x
  y := window.bank.slots[num].y
  singleClick(x, y, 7)
}

isInvSlotEmpty(slot) {
  x := window.inventory.slots[slot].tlx
  y := window.inventory.slots[slot].tly
  return ImageSearch(&_, &_, x, y, x + 30, y + 26, imgs.window.empty_inv_slot)
}

playerInTile(color, altHeight := 0) {
  px := window.player.x
  py := window.player.y
  
  playerColor := PixelGetColor(px, py - altHeight)

  if (playerColor == color) {
    return True
  }
  return False
}

amIDisconnected() {
  tl := {
    x: window.x,
    y: window.y
  }

  br := {
    x: window.x + window.w,
    y: window.y + window.h
  }

  return ImageSearch(&_, &_, tl.x, tl.y, br.x, br.y, imgs.window.disconnected)
}

logout(name := "") {
  stopLooping(name)

	closeX := 730
	closeY := 244
  
	logoutX := 647
	logoutY := 456

  selectTab("logout")
  Sleep(1500)
  singleClick(closeX, closeY, 6)
  Sleep(1500)
  singleClick(logoutX, logoutY, 5)
}

stopLooping(name := "") {  
  global isLooping

  if (name) {
    debug("Stopping " . name . "..")
  }

  isLooping := False
}

/*
* Click GE "price", "quantity", "plus_five", "plus_x", "buy_slot" (pass with num: Number), "confirm"
*/
clickGE(set := "confirm", num := 1) {
  x := -1
  y := -1

  switch set {
    case "price":
      x := window.ge.set_price.x
      y := window.ge.set_price.y
    case "quantity":
      x := window.ge.set_quantity.x
      y := window.ge.set_quantity.y
    case "plus_five":
      x := window.ge.plus_five.x
      y := window.ge.plus_five.y
    case "plus_x":
      x := window.ge.plus_x.x
      y := window.ge.plus_x.y
    case "confirm":
      x := window.ge.confirm.x
      y := window.ge.confirm.y
    case "buy_slot":
      x := window.ge.buy_item_slots[num].x
      y := window.ge.buy_item_slots[num].y
  }
  
  singleClick(x, y, 6)
}

; Not the best implementation, but works for now.
holdSpace() {
  Run("..\helpers\hold_space.ahk " . isLooping)
}

/*
#HotIf WinActive("YourWindowTitle")
~Esc::x := y
#HotIf
*/

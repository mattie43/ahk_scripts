#Requires AutoHotkey v2.0

; Window setters
window := {}
window.game := {
	src: imgs.window.game,
	height: 336,
	width: 514,
	x: -1,
	y: -1,
}
window.player := {
  x: -1,
  y: -1
}
window.bank := {
  deposit: {
    x: -1,
    y: -1
  },
  close: {
    x: -1,
    y: -1
  },
  slots: []
}
window.inventory := {
	src: imgs.window.inventory,
	height: 261,
	width: 236,
	x: -1,
	y: -1,
  slots: []
}
window.chat := {
	src: imgs.window.chat,
	height: 141,
	width: 518,
	x: -1,
	y: -1
}
window.tick_counter := {
	src: imgs.window.tick_counter,
	height: 19,
	width: 19,
	x: -1,
	y: -1
}
window.ge := {
  close: {
    x: -1,
    y: -1
  },
  set_quantity: {
    x: -1,
    y: -1
  },
  set_price: {
    x: -1,
    y: -1
  },
  plus_five: {
    x: -1,
    y: -1
  },
  plus_x: {
    x: -1,
    y: -1
  },
  confirm: {
    x: -1,
    y: -1
  },
  buy_item_slots: []
}

; Tab setters
window.tabs := {}
window.tabs.combat := {
	x: -1,
	y: -1
}
window.tabs.skills := {
	x: -1,
	y: -1
}
window.tabs.quests := {
	x: -1,
	y: -1
}
window.tabs.inventory := {
	x: -1,
	y: -1
}
window.tabs.equipment := {
	x: -1,
	y: -1
}
window.tabs.prayer := {
	x: -1,
	y: -1
}
window.tabs.magic := {
	x: -1,
	y: -1
}
window.tabs.logout := {
	x: -1,
	y: -1
}

setRunelite() {
  SetTitleMatchMode(2)
  title := "RuneLite"
	
  if !WinExist(title) {
    MsgBox("Window not found: " . title)
		ExitApp
	}

  x := -1
  y := -1
  w := -1
  h := -1

  WinGetPos(&x, &y, &w, &h, title)
	
	window.x := x
	window.y := y
	window.w := w
	window.h := h
	window.title := title
}

activateRunelite() {
  WinActivate(window.title)
}

setWindowSection(section) {
  global gameImgError

	x := -1
	y := -1
	
	if ImageSearch(&x, &y, 0, 0, window.w, window.h, window.%section%.src) {
		window.%section%.x := x
		window.%section%.y := y
	} else {
    MsgBox("Failed to find img: " . section)
    ExitApp
	}
}

setTabsCoords() {
	startingX := window.inventory.x + 18
	startingY := window.inventory.y - 22
	
	window.tabs.combat.x := startingX
	window.tabs.combat.y := startingY
	
	window.tabs.skills.x := startingX + 33
	window.tabs.skills.y := startingY
	
	window.tabs.quests.x := startingX + 66
	window.tabs.quests.y := startingY

	window.tabs.inventory.x := startingX + 99
	window.tabs.inventory.y := startingY
	
	window.tabs.equipment.x := startingX + 133
	window.tabs.equipment.y := startingY
	
	window.tabs.prayer.x := startingX + 166
	window.tabs.prayer.y := startingY
	
	window.tabs.magic.x := startingX + 199
	window.tabs.magic.y := startingY

	window.tabs.logout.x := startingX + 99
	window.tabs.logout.y := startingY + 299
}

setInvSlotsCoords() {
	startingX := window.inventory.x + 41
	startingY := window.inventory.y + 11

  colX := [startingX, startingX + 42, startingX + 84, startingX + 126]
  colY := [startingY, startingY + 36, startingY + 72, startingY + 108, startingY + 144, startingY + 180, startingY + 216]

  for _, y in colY {
    for _, x in colX {
      window.inventory.slots.Push({
        tlx: x,
        tly: y,
        cx: x + 15,
        cy: y + 13
      })
    }
  }
}

setBankCoords() {
	startingX := window.game.x
	startingY := window.game.y

  window.bank.deposit.x := startingX + 440
  window.bank.deposit.y := startingY + 307
  window.bank.close.x := startingX + 483
  window.bank.close.y := startingY + 19
  window.bank.slots := [
    {
      x: startingX + 89,
      y: startingY + 95
    },
    {
      x: startingX + 139,
      y: startingY + 95
    },
  ]
}

setGECoords() {
	startingX := window.game.x
	startingY := window.game.y

  ; close
  window.ge.close.x := startingX + 481
  window.ge.close.y := startingY + 33
  ; set quantity
  window.ge.set_quantity.x := startingX + 212
  window.ge.set_quantity.y := startingY + 210
  ; set price
  window.ge.set_price.x := startingX + 384
  window.ge.set_price.y := startingY + 210
  ; set plus five
  window.ge.plus_five.x := startingX + 425
  window.ge.plus_five.y := startingY + 210
  ; set plus x
  window.ge.plus_x.x := startingX + 464
  window.ge.plus_x.y := startingY + 210
  ; set confirm
  window.ge.confirm.x := startingX + 257
  window.ge.confirm.y := startingY + 283
  ; buy slots
  window.ge.buy_item_slots := [
    {
      x: startingX + 54,
      y: startingY + 144
    },
    {
      x: startingX + 171,
      y: startingY + 144
    },
    {
      x: startingX + 288,
      y: startingY + 144
    },
    {
      x: startingX + 405,
      y: startingY + 144
    },
    {
      x: startingX + 54,
      y: startingY + 264
    },
    {
      x: startingX + 171,
      y: startingY + 264
    },
    {
      x: startingX + 288,
      y: startingY + 264
    },
    {
      x: startingX + 405,
      y: startingY + 264
    },
  ]
}

setPlayerCoords() {
	startingX := window.game.x
	startingY := window.game.y

  window.player.x := startingX + 257
  window.player.y := startingY + 168
}

setup() {  
  setRunelite()
  activateRunelite()
  Sleep(100)
  sections := ["game", "inventory", "chat", "tick_counter"]
  for ind, section in sections {
    setWindowSection(section)
  }
  setTabsCoords()
  setInvSlotsCoords()
  setBankCoords()
  setPlayerCoords()
  setGECoords()
}

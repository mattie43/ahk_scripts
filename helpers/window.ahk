#Requires AutoHotkey v2.0

; Game images
game_img := "*TransBlack .\imgs\game.png"
inventory_img := "*TransBlack .\imgs\inventory.png"
chat_img := "*TransBlack .\imgs\chat.png"
tick_counter_img := ".\imgs\tick_counter.png"

; Window setters
window := {}
window.game := {
	src: game_img,
	height: 336,
	width: 514,
	x: -1,
	y: -1,
}
window.inventory := {
	src: inventory_img,
	height: 261,
	width: 236,
	x: -1,
	y: -1,
  slots: []
}
window.chat := {
	src: chat_img,
	height: 141,
	width: 518,
	x: -1,
	y: -1
}
window.tick_counter := {
	src: tick_counter_img,
	height: 19,
	width: 19,
	x: -1,
	y: -1
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
}

setInvSlotsCoords() {
	startingX := window.inventory.x + 56
	startingY := window.inventory.y + 20

  colX := [startingX, startingX + 42, startingX + 84, startingX + 126]
  colY := [startingY, startingY + 36, startingY + 72, startingY + 108, startingY + 144, startingY + 180, startingY + 216]

  for _, y in colY {
    for _, x in colX {
      window.inventory.slots.Push({ x: x, y: y })
    }
  }
}

setup() {
  setRunelite()
  activateRunelite()
  sections := ["game", "inventory", "chat", "tick_counter"]
  for ind, section in sections {
    setWindowSection(section)
  }
  setTabsCoords()
  setInvSlotsCoords()
}

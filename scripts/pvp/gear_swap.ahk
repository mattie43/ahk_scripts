#Requires AutoHotkey v2.0

gearSwap() {
  a := 25
  b := 35
  one := window.inventory.slots[13]
  two := window.inventory.slots[14]
  three := window.inventory.slots[17]
  rand := Random(-5, 5)

  ; equip item one
  MouseMove(one.cx + rand, one.cy + rand)
  randSleep(a,b)
  Click()
  randSleep(a,b)
  
  ; equip item two
  MouseMove(two.cx + rand, two.cy + rand)
  randSleep(a,b)
  Click()
  randSleep(a,b)
  
  ; equip item three
  MouseMove(three.cx + rand, three.cy + rand)
  randSleep(a,b)
  Click()
  randSleep(a,b)
}
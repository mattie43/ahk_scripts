#Requires AutoHotkey v2.0

instaMaul() {
  rand := Random(-5,5)
  MouseGetPos(&mx, &my)

  ; Pray
  Send("{F3}")  
  MouseMove(720 + rand, 332 + rand)
  randSleep(35,45)
  Click()
  randSleep(35,45)
  
  ; Equip
  Send("{F2}")
  randSleep(35,45)
  clickInventory(17)
  randSleep(35,45)
  clickInventory(21)
  randSleep(35,45)

  ; Spec
  Send("{F1}")
  MouseMove(589 + rand, 446 + rand)
  randSleep(35,45)
  Click()
  randSleep(35,45)
  Click()

  ; Click opp
  MouseMove(mx, my)
  randSleep(35,45)
  Click()
}

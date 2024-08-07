#Requires AutoHotkey v2.0

#Include ".\gear_swap.ahk"

mage() {
  rand := Random(-5, 5)
  MouseGetPos(&mx, &my)

  ; pray
  Send("{F3}")
  Sleep(50)
  MouseMove(570 + rand, 407 + rand)
  randSleep(20,40)
  Click()
  randSleep(20,40)
  
  Send("{F2}")
  Sleep(50)

  if (findImageIn(&x, &y, imgs.v1.zamorak_cape, "inventory")) {
    gearSwap()
    
    ; flames of zammy
    Send("{F4}")
    randSleep(20,40)
    MouseMove(575 + rand, 400 + rand)
    randSleep(20,40)
    Click()
    randSleep(20,40)
    
    ; click opp
    MouseMove(mx, my)
    randSleep(20,40)
    Click()

    ; 570,407
  }
}

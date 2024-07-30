#Requires AutoHotkey v2.0

#Include ".\gear_swap.ahk"

range() {
  rand := Random(-5,5)
  MouseGetPos(&mx, &my)
  
  ; pray
  Send("{F3}")
  Sleep(50)
  MouseMove(720 + rand, 366 + rand)
  randSleep(20,40)
  Click()
  randSleep(20,40)

  ; inventory
  Send("{F2}")
  Sleep(50)

  if (findImageIn(&x, &y, imgs.ava_accum, "inventory")) {
    gearSwap()
    
    ; click opp
    MouseMove(mx, my)
    randSleep(20,40)
    Click()

    ; 720,366
  }
}

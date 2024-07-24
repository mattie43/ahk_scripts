#Requires AutoHotkey v2.0

nmz() {
  ; clickPot() {
  ;   rand := Random(6,10)
  ;   coords := findImageIn(pray1Img, "inventory")
  ;   if (coords.x != -1 ) {
  ;     MouseMove(coords.x + rand, coords.y + rand)
  ;     randSleep(90,120)
  ;     Click()
  ;     return
  ;   }
  
  ;   coords := findImageIn(pray2Img, "inventory")
  ;   if (coords.x != -1 ) {
  ;     MouseMove(coords.x + rand, coords.y + rand)
  ;     randSleep(90,120)
  ;     Click()
  ;     return
  ;   }
  
  ;   coords := findImageIn(pray3Img, "inventory")
  ;   if (coords.x != -1 ) {
  ;     MouseMove(coords.x + rand, coords.y + rand)
  ;     randSleep(90,120)
  ;     Click()
  ;     return
  ;   }

  ;   coords := findImageIn(pray4Img, "inventory")
  ;   if (coords.x != -1 ) {
  ;     MouseMove(coords.x + rand, coords.y + rand)
  ;     randSleep(90,120)
  ;     Click()
  ;     return
  ;   }
  ; }

  ; callback() {
  ;   if (ImageSearch(&x, &y, 0, 0, 900, 900, prayOrb12Img)) {
  ;     clickPot()
  ;     return Sleep(2000)
  ;   }
  ;   if (ImageSearch(&x, &y, 0, 0, 900, 900, prayOrb11Img)) {
  ;     clickPot()
  ;     return Sleep(2000)
  ;   }
  ;   if (ImageSearch(&x, &y, 0, 0, 900, 900, prayOrb10Img)) {
  ;     clickPot()
  ;     return Sleep(2000)
  ;   }
  ; }

  ; listenToColorChange(callback)

  if findImageIn(&x, &y, imgs.prayer_1, "inventory", 10, 10) {
    debug("true")
    MouseMove(x, y)
  } else {
    debug("false")
  }
}

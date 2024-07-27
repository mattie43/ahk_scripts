#Requires AutoHotkey v2.0

nmz() {
  clickPot() {
    rand := Random(6,10)
    
    if (findImageIn(&x, &y, imgs.prayer_1, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.prayer_2, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.prayer_3, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }

    if (findImageIn(&x, &y, imgs.prayer_4, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  }

  callback() {
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.prayer_orb_12)) {
      clickPot()
      return Sleep(2000)
    }
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.prayer_orb_11)) {
      clickPot()
      return Sleep(2000)
    }
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.prayer_orb_10)) {
      clickPot()
      return Sleep(2000)
    }
  }

  listenToColorChange(callback)

  ; if findImageIn(&x, &y, imgs.prayer_1, "inventory", 10, 10) {
  ;   debug("true")
  ;   MouseMove(x, y)
  ; } else {
  ;   debug("false")
  ; }
}

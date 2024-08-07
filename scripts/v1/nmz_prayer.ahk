#Requires AutoHotkey v2.0

nmzPrayer() {
  clickPot() {
    rand := Random(6,10)
    
    if (findImageIn(&x, &y, imgs.v1.prayer_1, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.v1.prayer_2, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.v1.prayer_3, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }

    if (findImageIn(&x, &y, imgs.v1.prayer_4, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  }

  callback() {
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.v1.prayer_orb_12)) {
      clickPot()
      return Sleep(2000)
    }
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.v1.prayer_orb_11)) {
      clickPot()
      return Sleep(2000)
    }
    if (ImageSearch(&x, &y, 0, 0, 900, 900, imgs.v1.prayer_orb_10)) {
      clickPot()
      return Sleep(2000)
    }
  }

  listenToColorChange(callback)
}

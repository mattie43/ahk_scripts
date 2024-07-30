#Requires AutoHotkey v2.0

nmzAbsorption() {
  tickCount := 0
  firstRun := True

  clickPot() {
    rand := Random(6,10)
    
    if (findImageIn(&x, &y, imgs.absorption_1, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.absorption_2, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.absorption_3, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }

    if (findImageIn(&x, &y, imgs.absorption_4, "inventory", 0, 0)) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  }

  clickPrayerOrb() {
    rand := Random(1,8)
    if ImageSearch(&x, &y, 0, 0, 900, 900, imgs.minimap_prayer) {
      singleClick(x + rand, y + rand)
      randSleep(100,130)
      Click()
    }
  }

  callback() {
    if (firstRun) {
      clickPrayerOrb()
      randSleep(100,130)
      clickPot()
      firstRun := False
    }
    
    if (tickCount > 80) {
      rand := Random(1,10)
      if (rand == 1 OR tickCount > 94) {
        tickCount := 0
        clickPrayerOrb()
        randSleep(100,130)
        clickPot()
      }
    }

    tickCount += 1
  }

  listenToColorChange(callback, "nmz - absorption")
}

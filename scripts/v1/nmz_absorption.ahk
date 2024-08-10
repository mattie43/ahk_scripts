#Requires AutoHotkey v2.0

nmzAbsorption() {
  tickCount := 0
  firstRun := True
  sentMsg := False

  clickPot() {
    rand := Random(6,10)
    
    if (findImageIn(&x, &y, imgs.v1.absorption_1, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.v1.absorption_2, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
  
    if (findImageIn(&x, &y, imgs.v1.absorption_3, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }

    if (findImageIn(&x, &y, imgs.v1.absorption_4, "inventory")) {
      MouseMove(x + rand, y + rand)
      randSleep(90,120)
      Click()
      return
    }
    
    if (!sentMsg) {
      sentMsg := True
      SendMsgToDiscord("No more absorptions left..")
    }
  }

  clickPrayerOrb() {
    rand := Random(1,8)
    if ImageSearch(&x, &y, 0, 0, 900, 900, imgs.v1.minimap_prayer) {
      doubleClick(x + rand, y + rand)
    }
  }

  callback() {
    if (firstRun) {
      clickPrayerOrb()
      randSleep(100,130)
      clickPot()
      firstRun := False
    }
    
    if (tickCount > 70) {
      rand := Random(1,10)
      if (rand == 1 OR tickCount > 80) {
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

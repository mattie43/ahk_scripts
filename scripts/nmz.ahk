#Requires AutoHotkey v2.0

absorption4Img := "*TransBlack ..\imgs\absorption_4.png"
absorption3Img := "*TransBlack ..\imgs\absorption_3.png"
absorption2Img := "*TransBlack ..\imgs\absorption_2.png"
absorption1Img := "*TransBlack ..\imgs\absorption_1.png"

nmz() {
  if ImageSearch(&x, &y, window.inventory.x, window.inventory.y, window.inventory.x + window.inventory.width, window.inventory.y + window.inventory.height, absorption4Img) {
    debug("image 4 found")
    MouseMove(x, y)
  } else {
    debug("image 4 NOT found")
  }
  Sleep(500)
  MouseMove(10, 10)
  Sleep(500)
  if ImageSearch(&x, &y, window.inventory.x, window.inventory.y, window.inventory.x + window.inventory.width, window.inventory.y + window.inventory.height, absorption3Img) {
    debug("image 3 found")
    MouseMove(x, y)
  } else {
    debug("image 3 NOT found")
  }
  Sleep(500)
  MouseMove(10, 10)
  Sleep(500)
  if ImageSearch(&x, &y, window.inventory.x, window.inventory.y, window.inventory.x + window.inventory.width, window.inventory.y + window.inventory.height, absorption2Img) {
    debug("image 2 found")
    MouseMove(x, y)
  } else {
    debug("image 2 NOT found")
  }
  Sleep(500)
  MouseMove(10, 10)
  Sleep(500)
  if ImageSearch(&x, &y, window.inventory.x, window.inventory.y, window.inventory.x + window.inventory.width, window.inventory.y + window.inventory.height, absorption1Img) {
    debug("image 1 found")
    MouseMove(x, y)
  } else {
    debug("image 1 NOT found")
  }
}

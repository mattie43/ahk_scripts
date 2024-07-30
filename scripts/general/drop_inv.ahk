#Requires AutoHotkey v2.0

global dropInvSkips := []

dropInv() {
  global dropInvSkips

  MouseGetPos(&x, &y)
  dropInventory(dropInvSkips)
  MouseMove(x, y)
}

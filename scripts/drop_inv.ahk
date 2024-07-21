#Requires AutoHotkey v2.0

dropInv() {
  MouseGetPos(&x, &y)
  dropInventory()
  MouseMove(x, y)
}

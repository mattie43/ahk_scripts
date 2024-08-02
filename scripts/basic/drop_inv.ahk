#Requires AutoHotkey v2.0

dropInv() {
  global basicEditBox

  dropInvSkips := StrSplit(basicEditBox, ",")

  MouseGetPos(&x, &y)
  debug("Starting drop inventory..")
  dropInventory(dropInvSkips)
  debug("Drop inventory finished.")
  MouseMove(x, y)
}

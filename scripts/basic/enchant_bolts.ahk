#Requires AutoHotkey v2.0

enchantBolts() {
  holdSpace()
  listenToColorChange((*) => Click(), "enchant bolts")
}
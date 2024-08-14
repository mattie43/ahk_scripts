#Requires AutoHotkey v2.0

#Include ".\drop_inv.ahk"
#Include ".\get_color_at_mouse.ahk"
#Include ".\pray_flick.ahk"
#Include ".\click_x_ticks.ahk"
#Include ".\fletch_darts.ahk"
#Include ".\ocr_test.ahk"
#Include ".\enchant_bolts.ahk"

basicScripts := [
  {
    name: "Get Color @Mouse",
    fn: (*) => getColorAtMouse(),
    desc: "Tool for developing."
  },
  {
    name: "Pray Flick",
    fn: (*) => prayFlick(),
    desc: "You need to have your mouse over your prayer orb/prayer book that you want to pray flick. Then begin this script."
  },
  {
    name: "Click Every X Ticks",
    fn: (*) => clickXTicks(),
    desc: "Set a value for number of ticks (~0.6 sec) that you want to click at repeatedly. Then begin this script."
  },
  {
    name: "Drop Inventory",
    fn: (*) => dropInv(),
    desc: 'Enter the inventory slots you want to skip separated by commas. Example: "1,2,3". If the box is left empty, all slots will be dropped.'
  },
  {
    name: "Fletch Darts",
    fn: (*) => fletchDarts(),
    desc: 'Place your dart tips and feathers in slots one and two of your inventory. "Use" the item in the second slot of your inventory, then begin this script.'
  },
  {
    name: "OCR Testing",
    fn: (*) => ocrTest(),
    desc: 'Tool for developing.'
  },
  {
    name: "Enchant Bolts",
    fn: (*) => enchantBolts(),
    desc: 'Have the bolts and runes req. in your inventory that you want to one tick enchant. Place your mouse on "Crossbow Bolt Enchantemnts" spell and begin this script.'
  },
]
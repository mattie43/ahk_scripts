#Requires AutoHotkey v2.0

#Include "..\helpers\index.ahk"
#Include ".\drop_inv.ahk"
#Include ".\get_color_at_mouse.ahk"
#Include ".\pray_flick.ahk"
#Include ".\agility.ahk"
#Include ".\mahog_tables.ahk"
#Include ".\fletch_darts.ahk"
#Include ".\nmz.ahk"
#Include ".\cooking.ahk"
#Include ".\one_tick_cooking.ahk"

generalScripts := [
  {
    name: "Drop Inventory",
    fn: dropInv,
    desc: ""
  },
  {
    name: "Pray Flick",
    fn: prayFlick,
    desc: ""
  },
  {
    name: "Get Color @Mouse",
    fn: getColorAtMouse,
    desc: ""
  },
]

otherScripts := [
  {
    name: "NMZ - Prayer",
    fn: (*) => nmz(),
    desc: "nmz pray desc"
  },
  {
    name: "Mahogany Tables",
    fn: (*) => mahogTables(),
    desc: "mahog tables desc"
  },
  {
    name: "Fletch Darts",
    fn: (*) => fletchDarts(),
    desc: "fletch darts desc"
  },
  {
    name: "Cooking",
    fn: (*) => cooking(),
    desc: "cooking desc"
  },
  {
    name: "One Tick Karam",
    fn: (*) => oneTickCooking(),
    desc: "one tick cooking desc"
  },
]

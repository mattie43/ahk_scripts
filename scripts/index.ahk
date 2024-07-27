#Requires AutoHotkey v2.0

#Include "..\helpers\index.ahk"
; General
#Include ".\general\drop_inv.ahk"
#Include ".\general\get_color_at_mouse.ahk"
#Include ".\general\pray_flick.ahk"
; Other
#Include ".\other\agility.ahk"
#Include ".\other\cooking.ahk"
#Include ".\other\fletch_darts.ahk"
#Include ".\other\mahog_tables.ahk"
#Include ".\other\nmz.ahk"
#Include ".\other\one_tick_cooking.ahk"
; PvP
#Include ".\pvp\mage.ahk"
#Include ".\pvp\range.ahk"
; #Include ".\pvp\spec.ahk"

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

pvpScripts := [
  {
    name: "Range",
    fn: (*) => range(),
    desc: "INCOMPLETE"
  },
  {
    name: "Mage",
    fn: (*) => mage(),
    desc: "INCOMPLETE"
  },
]

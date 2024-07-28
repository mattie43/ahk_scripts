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
#Include ".\other\alch_came.ahk"
#Include ".\other\barb_fishing.ahk"
#Include ".\other\oak_larders.ahk"
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
    desc: "Start in NMZ with any number of pray pots in your inventory, and pray melee already active."
  },
  {
    name: "Const. - Mahogany Tables",
    fn: (*) => mahogTables(),
    desc: "*Requires Demon Butler and Servant's Money Bag* Stand next to a table space. Set your camera top down, North, and zoom enough to see the entire table. Make your butler retrieve 24 mahogany planks from your bank. When he returns, start the script."
  },
  {
    name: "Const. - Oak Larders",
    fn: (*) => oakLarders(),
    desc: "*Requires Demon Butler and Servant's Money Bag* Stand next to a larder space. Set your camera top down, North, and zoom enough to see the entire larder. Make your butler retrieve 24 oak planks from your bank. When he returns, start the script."
  },
  {
    name: "Fletch Darts",
    fn: (*) => fletchDarts(),
    desc: "Place your dart tips and feathers in slots 1 and 2 of you inv. Click on the second slot of your inventory, then begin the script."
  },
  {
    name: "Cooking - Any",
    fn: (*) => cooking(),
    desc: 'Start in Rogues Den or Myths Guild. Set your camera top down and use the camera point plugin named "Cooking". Put a cyan (FF00BEFF) screen marker around the food you want to cook in your bank. Start with the bank closed, and then begin.'
  },
  {
    name: "Cooking - One Tick Karam",
    fn: (*) => oneTickCooking(),
    desc: 'Start in Rogues Den or Myths Guild. Set your camera top down and use the camera point plugin named "Cooking". Put a cyan (FF00BEFF) screen marker around the karambwans in your bank. Start with the bank closed, and then begin.'
  },
  {
    name: "Alch Camelot Tele",
    fn: (*) => alchCame(),
    desc: "*INCOMPLETE* Tele to Camelot. Set your alch item undernearth the high alch spot of your spellbook. Then begin the script."
  },
  {
    name: "Barb Fishing",
    fn: (*) => barbFishing(),
    desc: 'Set your camera top down and use the camera point plugin named "Barb Fishing". Have your rod and feathers in inv slots 1 and 2. Start fishing one time, then begin the script.'
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

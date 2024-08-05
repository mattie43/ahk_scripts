#Requires AutoHotkey v2.0

#Include "..\helpers\index.ahk"
; Basic
#Include ".\basic\drop_inv.ahk"
#Include ".\basic\get_color_at_mouse.ahk"
#Include ".\basic\pray_flick.ahk"
#Include ".\basic\click_x_ticks.ahk"
#Include ".\basic\fletch_darts.ahk"
; Advanced
#Include ".\advanced\agility\agility.ahk"
#Include ".\advanced\cooking.ahk"
#Include ".\advanced\mahog_tables.ahk"
#Include ".\advanced\nmz_prayer.ahk"
#Include ".\advanced\nmz_absorption.ahk"
#Include ".\advanced\one_tick_cooking.ahk"
#Include ".\advanced\alch_came.ahk"
#Include ".\advanced\barb_fishing.ahk"
#Include ".\advanced\oak_larders.ahk"
#Include ".\advanced\falconry.ahk"
#Include ".\advanced\stall_stealer.ahk"
; PvP
#Include ".\pvp\mage.ahk"
#Include ".\pvp\range.ahk"
#Include ".\pvp\insta_maul.ahk"
; #Include ".\pvp\spec.ahk"

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
]

advancedScripts := [
  {
    name: "NMZ - Prayer",
    fn: (*) => nmzPrayer(),
    desc: "Start in NMZ with any number of pray pots in your inventory, and pray melee already active."
  },
  {
    name: "NMZ - Absorption",
    fn: (*) => nmzAbsorption(),
    desc: "Set your quick prayers to have Rapid Heal. Enter NMZ with absorptions and a rock cake. Put yourself to 1 HP and drink some absorptions. Then begin this script."
  },
  {
    name: "Const. - Mahogany Tables",
    fn: (*) => mahogTables(),
    desc: "*Requires Demon Butler and Servant's Money Bag* Stand next to a table space. Set your camera top down, North, and zoom enough to see the entire table. Make your butler retrieve 24 mahogany planks from your bank. When he returns, start this script."
  },
  {
    name: "Const. - Oak Larders",
    fn: (*) => oakLarders(),
    desc: "*Requires Demon Butler and Servant's Money Bag* Stand next to a larder space. Set your camera top down, North, and zoom enough to see the entire larder. Make your butler retrieve 24 oak planks from your bank. When he returns, start this script."
  },
  {
    name: "Cooking - Any",
    fn: (*) => cooking(),
    desc: 'Start in Rogues Den or Myths Guild. Set your camera top down and use the camera point plugin named "Cooking/Stalls". Put a cyan (FF00BEFF) screen marker around the food you want to cook in your bank. Start with the bank closed, and then begin.'
  },
  {
    name: "Cooking - One Tick Karam",
    fn: (*) => oneTickCooking(),
    desc: 'Start in Rogues Den or Myths Guild. Set your camera top down and use the camera point plugin named "Cooking/Stalls". Put a cyan (FF00BEFF) screen marker around the karambwans in your bank. Start with the bank closed, and then begin.'
  },
  {
    name: "Alch Camelot Tele",
    fn: (*) => alchCame(),
    desc: "*INCOMPLETE* Tele to Camelot. Set your alch item undernearth the high alch spot of your spellbook. Then begin this script."
  },
  {
    name: "Barb Fishing",
    fn: (*) => barbFishing(),
    desc: 'Set your camera top down and use the camera point plugin "Barb Fishing". Have your rod and feathers in inv slots 1 and 2. Start fishing one time, then begin this script.'
  },
  {
    name: "Falconry",
    fn: (*) => falconry(),
    desc: 'Set your camera top down and use the camera point plugin "Falconry". Move your character to the SE of the Piscarilius hunting area. Then being this script.'
  },
  {
    name: "Stall Stealer",
    fn: (*) => stallStealer(),
    desc: 'Set your camera top down and use the camera point plugin "Cooking/Stalls". Works on any stall. If the stall is not already marked, just object mark it pink (FFFF00FF). Then begin this script.'
  },
  {
    name: "Agility Rooftops",
    fn: (*) => agility(),
    desc: 'WIP'
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
  {
    name: "Insta Maul",
    fn: (*) => instaMaul(),
    desc: "INCOMPLETE"
  },
]

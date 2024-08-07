#Requires AutoHotkey v2.0

#Include ".\agility\agility.ahk"
#Include ".\cooking.ahk"
#Include ".\mahog_tables.ahk"
#Include ".\nmz_prayer.ahk"
#Include ".\nmz_absorption.ahk"
#Include ".\one_tick_cooking.ahk"
#Include ".\alch_came.ahk"
#Include ".\barb_fishing.ahk"
#Include ".\oak_larders.ahk"
#Include ".\falconry.ahk"
#Include ".\stall_stealer.ahk"
#Include ".\smithing.ahk"
#Include ".\gem_cutting.ahk"
#Include ".\glass_blowing.ahk"
#Include ".\woodcutting.ahk"
#Include ".\herblore_14.ahk"

v1Scripts := [
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
    desc: '*Incomplete* Only working in Draynor Village atm, does not pick up marks. Set camera top down, camera point pluigin "Agility". Begin at ending blue square.'
  },
  {
    name: "Smithing - Gold Ore",
    fn: (*) => smithing(),
    desc: 'Make sure gold ores are visible in your bank. Have "Quantity: All" selected. Make sure "Space" is set to gold bars (your last option) at the furnace. Stand in front of the pink bank booth in Edgeville with a full inventory of gold ores. Then begin this script.'
  },
  {
    name: "Crafting - Gem Cutting",
    fn: (*) => gemCutting(),
    desc: 'Stand west of the marked banker in the GE. Put a chisel in slot one of you inventory. Mark your gems in your bank with a cyan (FF00BEFF) screen marker. Have "Quantity: All" selected. Close your bank interface. Set your camera top down and use the camera point plugin named "Cooking/Stalls". Then begin this script.'
  },
  {
    name: "Crafting - Glass Blowing",
    fn: (*) => glassBlowing(),
    desc: 'Stand west of the marked banker in the GE. Put a glassblowing pipe in slot one of you inventory. Have "Quantity: All" selected. Make sure molten glass is in view in your bank. Close your bank interface. Make sure "Space" is set to the item you want to make (your last option). Set your camera top down and use the camera point plugin named "Cooking/Stalls". Then begin this script.'
  },
  {
    name: "Woodcutting - Teak",
    fn: (*) => woodcutting(),
    desc: '*Incomplete, but useable* Start in the North of Isle of Soul in-between the two marked teak trees. Your first inventory slot will not be dropped. Set the camera top down and use the Cooking/Stalls camera point plugin. Then begin the script.'
  },
  {
    name: "Herblore - 14",
    fn: (*) => herblore14(),
    desc: 'Stand west of the marked banker in the GE. Mark your herblore pot and secondary ingredient in your bank with a cyan (FF00BEFF) and orange (FFFF6000) screen marker. Have "Quantity: 14" selected. Close your bank interface. Set your camera top down and use the camera point plugin named "Cooking/Stalls". Then begin this script.'
  },
]
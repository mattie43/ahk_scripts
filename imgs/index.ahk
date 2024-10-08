#Requires AutoHotkey v2.0

imgs := {}

; Window imgs
imgs.window := {
  game: "*TransBlack ..\imgs\window\game.png",
  inventory: "*70 *TransBlack ..\imgs\window\inventory.png",
  chat: "*TransBlack ..\imgs\window\chat.png",
  tick_counter: "..\imgs\window\tick_counter.png",
  bank_title: "*50 ..\imgs\window\bank_title.png",
  bank_close_btn: "*50 ..\imgs\window\bank_close_btn.png",
  empty_inv_slot: "*20 ..\imgs\window\empty_inv_slot.png",
  disconnected: "*TransBlack ..\imgs\window\disconnected.png",
  welcome_screen: "*50 ..\imgs\window\welcome_screen.png",
}

/*
  Name all keys the same as your img.
  Add *TransBlack for any transparent imgs.
  Add *50 for any others.
  The string needs to start from root "..\".
*/

; v1 imgs
imgs.v1 := {
  prayer_1: "*TransBlack ..\imgs\v1\prayer_1.png",
  prayer_2: "*TransBlack ..\imgs\v1\prayer_2.png",
  prayer_3: "*TransBlack ..\imgs\v1\prayer_3.png",
  prayer_4: "*TransBlack ..\imgs\v1\prayer_4.png",
  absorption_1: "*TransBlack ..\imgs\v1\absorption_1.png",
  absorption_2: "*TransBlack ..\imgs\v1\absorption_2.png",
  absorption_3: "*TransBlack ..\imgs\v1\absorption_3.png",
  absorption_4: "*TransBlack ..\imgs\v1\absorption_4.png",
  prayer_orb_10: "*50 ..\imgs\v1\prayer_orb_10.png",
  prayer_orb_11: "*50 ..\imgs\v1\prayer_orb_11.png",
  prayer_orb_12: "*50 ..\imgs\v1\prayer_orb_12.png",
  not_cooking: "*TransBlack ..\imgs\v1\not_cooking.png",
  demon_butler_retrieve: "*50 ..\imgs\v1\demon_butler_retrieve.png",
  ava_accum: "*50 ..\imgs\v1\ava_accum.png",
  black_chaps: "*50 ..\imgs\v1\black_chaps.png",
  g_maul: "*TransBlack ..\imgs\v1\g_maul.png",
  rune_crossbow: "*TransBlack ..\imgs\v1\rune_crossbow.png",
  zamorak_cape: "*TransBlack ..\imgs\v1\zamorak_cape.png",
  not_fishing: "*TransBlack ..\imgs\v1\not_fishing.png",
  anymore_fish: "*50 ..\imgs\v1\anymore_fish.png",
  minimap_prayer: "*TransBlack ..\imgs\v1\minimap_prayer.png",
  inventory_full: "*50 ..\imgs\v1\inventory_full.png",
  gold_ore: "*TransBlack ..\imgs\v1\gold_ore.png",
  molten_glass: "*TransBlack ..\imgs\v1\molten_glass.png",
  inventory_full_logs: "*50 ..\imgs\v1\inventory_full_logs.png",
  absorption_check: "*TransBlack *50 ..\imgs\v1\absorption_check.png",
  high_alch: "*TransBlack ..\imgs\v1\high_alch.png",
  camelot_tele: "*TransBlack *20 ..\imgs\v1\camelot_tele.png",
}

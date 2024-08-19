#Requires AutoHotkey v2.0

#Include ".\item_list.ahk"

class HighAlchNotedClass extends v2Helpers {
  name := "High Alch Noted Items"
	setup_img := "..\scripts\v2\[FOLDER_NAME]\setup.png"
  setup_text := "Line one.\nLine two."
	noted_item := "*TransBlack ..\scripts\v2\high_alch_noted\noted_item.png"
	high_alch_spell := "*TransBlack ..\scripts\v2\high_alch_noted\high_alch_spell.png"
	ge_collect := "*50 ..\scripts\v2\high_alch_noted\ge_collect.png"
	ge_buy_button := "*50 ..\scripts\v2\high_alch_noted\ge_buy_button.png"
	ge_listing_sold := "*20 ..\scripts\v2\high_alch_noted\ge_listing_sold.png"
  item_list_num := 2

  collect() {
    if findImageIn(&_, &_, this.ge_listing_sold, "game") {
      if findImageIn(&x, &y, this.ge_collect, "game") {
          singleClick(x + 37, y + 8, 6)
          this.setStep("start")
      }
    }
  }

  buy_items() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      switch this.stepCount {
        case 1: clickImageIn(this.ge_buy_button, "game")
        case 3:
          item := item_list[this.item_list_num]
          Send(item.name)
        case 5: Send("{Enter}")
        case 7: clickGE("quantity")
        case 9:
          item := item_list[this.item_list_num]
          Send("" . item.quantity)
          randSleep(90,130)
          Send("{Enter}")
        case 11: clickGE("plus_x")
        case 13:
          clickGE("confirm")
          if (this.item_list_num >= item_list.Length) {
            this.item_list_num := 1
          } else {
            this.item_list_num += 1
          }
          return this.setStep("collect")
      }
      this.incStepCount()
    }
  }

  open_ge() {
    if findColorIn(&x, &y, colors.pink, "game") {
      doubleClick(x, y, 6)
      this.setStep("buy_items")
    }
  }

  click_note() {
    if findImageIn(&x, &y, this.noted_item, "inventory") {
      singleClick(x + 12, y + 12, 6)
      this.setStep("alch")
    } else {
      this.incTickCount()
      if (this.tickCount > 3) {
        ; out of noted items?
        this.setStep("open_ge")
      }
    }
  }

  alch() {
    if findImageIn(&x, &y, this.high_alch_spell, "inventory") {
      singleClick(x + 8, y + 8, 5)
      this.setStep("click_note")
    } else {
      this.incTickCount()
      if (this.tickCount > 3) {
        selectTab("magic")
      }
    }
  }

  start() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      Send("{Esc}")
    }
    this.setStep("alch")
  }
}

high_alch_noted := HighAlchNotedClass()

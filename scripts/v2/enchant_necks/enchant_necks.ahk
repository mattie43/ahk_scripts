#Requires AutoHotkey v2.0

class EnchantNecksClass extends v2Helpers {
  name := "incomplete - Enchant Necks"
	setup_img := "..\scripts\v2\[FOLDER_NAME]\setup.png"
  setup_text := "Line one.\nLine two."
	sapphire_enchant := "*50 ..\scripts\v2\enchant_necks\sapphire_enchant.png"
	emerald_enchant := "*50 ..\scripts\v2\enchant_necks\emerald_enchant.png"
	ruby_enchant := "*50 ..\scripts\v2\enchant_necks\ruby_enchant.png"

  enchant() {
    if (this.stepCount > 26) {
      this.incStepCount()
      if (this.stepCount > 29) {
        return this.setStep("click_bank")
      } else {
        return
      }
    }
    ; Sapphire
    if findImageIn(&x, &y, this.sapphire_enchant, "inventory") {
      singleClick(x + 2, y + 2, 4)
      randSleep(90,130)
      clickInventory(this.stepCount + 2)
      return this.incStepCount()
    }
    ; Emerald
    if findImageIn(&x, &y, this.emerald_enchant, "inventory") {
      singleClick(x + 2, y + 2, 4)
      randSleep(90,130)
      clickInventory(this.stepCount + 2)
      return this.incStepCount()
    }
    ; Ruby
    if findImageIn(&x, &y, this.ruby_enchant, "inventory") {
      singleClick(x + 2, y + 2, 4)
      randSleep(90,130)
      clickInventory(this.stepCount + 2)
      return this.incStepCount()
    }
  }

  bank() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      this.setSkip()
      clickInventory(2)
      randSleep(200,250)
      clickBankSlot(1)
      randSleep(200,250)
      Send("{Esc}")
      randSleep(200,250)
      this.setStep("enchant")
    }
  }

  click_bank() {
    if clickColorIn(colors.pink, "game") {
      this.setStep("bank")
    }
  }

  start() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      this.setStep("bank")
    } else {
      this.setStep("click_bank")
    }
  }
}

enchant_necks := EnchantNecksClass()

#Requires AutoHotkey v2.0

class HerbloreClass extends v2Helpers {
  name := ""
	setup_img := "..\scripts\v2\[FOLDER_NAME]\setup.png"
  setup_text := "Stand next to any banker/booth marked pink (FFFF00FF).\nSet camera top down.\nSet camera point to 'Bank'.\nPut your unf. pot and secondary ingredient in the first and second slot of any bank tab.\nSet 'Quantity: X' to 14 in bank.\nBegin script."
	how_many := "*50 ..\scripts\v2\gem_cutting\how_many.png"

  combine() {
    switch (this.stepCount) {
      case 0:
        ; Just skip one tick to ensure bank close. Temp solution
        this.incStepCount()
      case 1:
        clickInventory(13)
        randSleep(90,130)
        clickInventory(17)
        randSleep(90,130)
        this.incStepCount()
      case 2:
        if findImageIn(&_, &_, this.how_many, "chat") {
          Send("{Space}")
          this.incStepCount()
        }
      case 3:
      this.incTickCount()
      if (this.tickCount > 30) {
        this.setStep("click_bank")
      }
    }
  }

  bank() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      this.setSkip()
      clickInventory(1)
      randSleep(200,250)
      clickBankSlot(1)
      randSleep(200,250)
      clickBankSlot(2)
      randSleep(200,250)
      Send("{Esc}")
      randSleep(200,250)
      this.setStep("combine")
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

herblore := HerbloreClass()

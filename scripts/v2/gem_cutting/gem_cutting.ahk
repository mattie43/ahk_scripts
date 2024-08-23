#Requires AutoHotkey v2.0

class GemCuttingClass extends v2Helpers {
  name := "1x27 Inventories"
	setup_img := "..\scripts\v2\gem_cutting\setup.png"
  setup_text := "Stand next to any banker/booth marked pink (FFFF00FF).\nSet camera top down.\nSet camera point to 'Bank'.\nPut your x27 item in the first slot of any bank tab.\nSet 'Quantity: All' in bank.\nPut your tool in slot one of your inventory.\nBegin script."
	quantity := "*50 ..\scripts\v2\gem_cutting\quantity.png"
  temp_img := ".\temp\image.png"

  takeSS() {
    screenshotInvSlot(28)
  }

  cut() {
    switch (this.stepCount) {
      case 0:
        if not isInvSlotEmpty(28) {
          this.takeSS()
          this.incStepCount()
        }
      case 1:
        clickInventory(1)
        randSleep(90,130)
        clickInventory(5)
        this.incStepCount()
      case 2:
        if findImageIn(&_, &_, this.quantity, "chat") {
          Send("{Space}")
          this.incStepCount()
        }
      case 3:
        if not isImgInInvSlot(this.temp_img, 28) {
          this.setStep("click_bank")
        }
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
      this.setStep("cut")
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

gem_cutting := GemCuttingClass()

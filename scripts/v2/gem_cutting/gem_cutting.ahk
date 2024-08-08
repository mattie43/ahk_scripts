#Requires AutoHotkey v2.0

class GemCuttingClass extends v2Helpers {
  name := "Gem Cutting/Stamina Potions"
	setup_img := "..\scripts\v2\gem_cutting\setup.png"
  setup_text := "Stand next to any banker/booth marked pink (FFFF00FF).\nSet camera top down.\nSet camera point to 'Bank'.\nPut your uncut gem/unf. pots in the first slot of any bank tab.\nSet 'Quantity: All' in bank.\nPut your chisel/amalyse crystals in slot one of your inventory.\nBegin script."
	how_many := "*50 ..\scripts\v2\gem_cutting\how_many.png"

  cut() {
    switch (this.stepCount) {
      case 0:
        ; Skipping one tick for safety
        this.incStepCount()
      case 1:
        clickInventory(1)
        randSleep(90,130)
        clickInventory(5)
        this.incStepCount()
      case 2:
        if findImageIn(&_, &_, this.how_many, "chat") {
          Send("{Space}")
          this.incStepCount()
        }
      case 3:
        this.incTickCount()
        if (this.tickCount > 54) {
          this.setStep("click_bank")
        }
    }
  }

  bank() {
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      this.setSkip()
      clickInventory(2)
      randSleep(200,250)
      bankSlotOne()
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

  run() {
    this.setStep("start")
    listenToColorChange((*) => 
      this.%this.step%()
      this.errorCheck(), this.name)
  }
}

gem_cutting := GemCuttingClass()

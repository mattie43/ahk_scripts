#Requires AutoHotkey v2.0

class AstralsClass extends v2Helpers {
  name := "RC - Astrals (incomplete)"
	setup_img := "..\scripts\v2\astrals\setup.png"
  setup_text := "Line one.\nLine two."
  shouldDrink := False

  clickPortal() {
    if clickColorIn(colors.off_cyan, "game") {
      this.setStep("click_bank")
    }
  }
    
  in_house() {
    if not findColorIn(&_, &_, colors.orange, "game") {
      return
    }

    if (this.shouldDrink) {
      if clickColorIn(colors.orange, "game") {
        this.setSkip()
        this.shouldDrink := False
        randSleep(4500,5500)
        this.clickPortal()
      }
    } else {
      this.shouldDrink := True
      this.clickPortal()
    }
  }

  teleport() {
    if isInvSlotEmpty(28) {
      this.setSkip()
      clickInventory(1)
      this.setStep("in_house")
    }
  }

  click_altar() {
    if (this.tickCount > 0) {
      this.incTickCount()
      if (this.tickCount > 1) {
        if clickColorIn(colors.pink, "game") {
          this.setStep("teleport")
        }
      }
    }

    if findColorIn(&_, &_, colors.pink, "game") {
      this.incTickCount()
    }
  }

  run_to_altar() {
    ; 700,146
    this.incTickCount()
    if (Mod(this.tickCount, 2) == 0) {
      singleClick(700, 146, 1)
      debug(this.tickCount)
    }
    if (this.tickCount > 38) {
      this.setStep("click_altar")
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
      this.setStep("run_to_altar")
    }
  }

  click_bank() {
    if clickColorIn(colors.pink, "game") {
      this.setStep("bank")
    }
  }

  start() {
    debug("starting astral?")
    if findImageIn(&_, &_, imgs.window.bank_close_btn, "game") {
      this.setStep("bank")
    } else {
      this.setStep("click_bank")
    }
  }
}

astrals := AstralsClass()

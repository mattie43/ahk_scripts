#Requires AutoHotkey v2.0

class AstralsClass extends v2Helpers {
  name := "RC - Astrals (incomplete)"
	setup_img := "..\scripts\v2\astrals\setup.png"
  setup_text := "Line one.\nLine two."

  run_to_altar() {
    ; 700,146
    this.incTickCount()
    if (Mod(this.tickCount, 2) == 0) {
      singleClick(700, 146, 1)
    }
    if (this.tickCount > 30) {
      ; this.resetTickCount()
      ; go to next step
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

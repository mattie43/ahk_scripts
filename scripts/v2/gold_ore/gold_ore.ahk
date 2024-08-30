#Requires AutoHotkey v2.0

class GoldOreClass extends v2Helpers {
  name := "Smithing - Gold Ore"
	setup_img := "..\scripts\v2\gold_ore\setup.png"
  setup_text := "Set your camera top down.\nSelect the 'Smithing' camera point.\nStand in front of the bank.\nMake sure 'Quantity: All' is selected in the bank.\nBegin script."
  gold_ore := "*TransBlack ..\scripts\v2\gold_ore\gold_ore.png"
  smithing_select := "*50 ..\scripts\v2\gold_ore\smithing_select.png"

  smith() {
    ; click furnace
    if (this.stepCount == 0) {
      if clickColorIn(colors.orange, "game") {
        this.incStepCount()
      }
    }
    ; wait for smelt chat option
    if (this.stepCount == 1) {
      if findImageIn(&_, &_, this.smithing_select, "chat") {
        Send("{6}")
        this.incStepCount()
      }
    }
    ; wait for inv finished
    if (this.stepCount == 2) {
      if not findImageIn(&_, &_, this.gold_ore, "inventory") {
        this.setStep("bank")
      }
    }
  }

  bank() {
    ; click bank
    if (this.stepCount == 0) {
      if clickColorIn(colors.pink, "game") {
        this.incStepCount()
      }
    }
    ; wait for gold ore in bank window
    if (this.stepCount == 1) {
      if findImageIn(&x, &y, this.gold_ore, "game") {
        this.incStepCount()
      }
    }
    if (this.stepCount == 2) {
      this.setSkip()
      ; click deposit
      depositAll()
      randSleep(100,200)
      ; click ore
      singleClick(x + 3, y + 3, 5)
      randSleep(100,200)
      ; esc bank screen
      Send("{Esc}")
      randSleep(100,200)
      this.setStep("smith")
    }
  }

  start() {
    if findImageIn(&_, &_, this.gold_ore, "inventory") {
      this.setStep("smith")
    } else {
      this.setStep("bank")
    }
  }
}

gold_ore := GoldOreClass()

#Requires AutoHotkey v2.0

class v2SmithingGoldOreClass {
  name := "Smithing - Gold Ore"
	setup_img := ".\smithing_gold_ore\setup.png"
  setup_text := ""
  gold_ore := "*TransBlack ..\imgs\v2\gold_ore.png"
  smithing_select := "*50 ..\imgs\v2\smithing_select.png"
  step := ""
  tickCount := 0
  stepCount := 0
  errorCount := 0

  smith() {
    ; click furnace
    if (this.stepCount == 0) {
      if not clickColorIn(colors.orange, "game") {
        debug("lf orange..")
      } else {
        this.incStepCount()
      }
    }
    ; wait for smelt chat option
    if (this.stepCount == 1) {
      if not findImageIn(&_, &_, this.smithing_select, "chat") {
        debug("lf chat img..")
      } else {
        Send("{6}")
        this.incStepCount()
      }
    }
    ; wait for inv finished
    if (this.stepCount == 2) {
      if findImageIn(&_, &_, this.gold_ore, "inventory") {
        debug("lf inv done..")
      } else {
        this.setStep("bank")
      }
    }
  }

  bank() {
    ; click bank
    if (this.stepCount == 0) {
      if not clickColorIn(colors.pink, "game") {
        debug("lf pink..")
      } else {
        this.incStepCount()
      }
    }
    ; wait for gold ore in bank window
    if (this.stepCount == 1) {
      if not findImageIn(&x, &y, this.gold_ore, "game") {
        debug("lf gold ore..")
      } else {
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

  skip() {
    return
  }

  setSkip() {
    this.step := "skip"
  }

  incStepCount() {
    this.stepCount += 1
  }

  setStep(step) {
    this.errorCount := 0
    this.tickCount := 0
    this.stepCount := 0
    this.step := step
  }

  throwError() {
    debug("Failed on step " . this.step . ", stopping..")
    return stopLooping()
  }

  callback() {
    this.%this.step%()
    this.errorCount += 1
    if (this.errorCount > 200) {
      this.throwError()
    }
  }

  run() {
    this.setStep("start")
    listenToColorChange(() => this.callback(), "smithing v2")
  }
}

v2SmithingGoldOre := v2SmithingGoldOreClass()

#Requires AutoHotkey v2.0

class v2Helpers {
  step := ""
  stepCount := 0
  tickCount := 0
  errorCount := 0

  skip() {
    return
  }

  setSkip() {
    this.step := "skip"
  }

  incStepCount() {
    this.stepCount += 1
  }

  incTickCount() {
    this.tickCount += 1
  }

  setStep(step) {
    this.errorCount := 0
    this.tickCount := 0
    this.stepCount := 0
    this.step := step
  }

  errorCheck() {
    this.errorCount += 1
    if (this.errorCount > 200) {
      this.throwError()
    }
  }

  throwError() {
    debug("Failed on step " . this.step . ", stopping..")
    return stopLooping()
  }

  run() {
    this.setStep("start")
    listenToColorChange((*) => 
      this.%this.step%()
      this.errorCheck(), this.name)
  }
}
#Requires AutoHotkey v2.0

class v2TemplateClass extends v2Helpers {
  name := ""
	setup_img := "..\scripts\v2\[FOLDER_NAME]\setup.png"
  setup_text := "Line 1.\nLine 2."

  /*
    Place your functions here using the same name as your step. Similar to the start step below.
    The v2Helpers class is what contains all the re-used variables and functions.
    `this.run()` will run on every game tick. Utilize `this.step: string`, `this.stepCount: number`,
    and `this.tickCount: number` to change what the bot does.
  */

  start() {
    ; Starting step.
  }

  ; You should not need to alter this fn.
  run() {
    this.setStep("start")
    listenToColorChange((*) => 
      this.%this.step%()
      this.errorCheck(), this.name)
  }
}

; Rename your export accordingly
v2Template := v2TemplateClass()

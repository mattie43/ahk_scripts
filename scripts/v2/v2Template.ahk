#Requires AutoHotkey v2.0

; Remember to #Include your script inside the "v2\index.ahk" file and add it to the `v2Scripts` array.

; Rename your class accordingly
class v2TemplateClass extends v2Helpers {
  name := ""
	setup_img := "..\scripts\v2\[FOLDER_NAME]\setup.png"
  ; Use `\n` to start a new step in your setup text.
  setup_text := "Line one.\nLine two."
  /*
    If you're importing more imgs for your script,
    remember to use *TransBlack for transparent imgs,
    and *50 for non-transparent imgs. Ex:

    additional_img := "*TransBlack ..\scripts\v2\[FOLDER_NAME]\additional_img.png"
  */

  /*
    Place your functions here using the same name as your step. Similar to the start step below.
    The v2Helpers class is what contains all the re-used variables and functions.
    The `start` step will be the step called on each game tick until `this.step` is changed.
    Use `this.setStep("next_step_name")` to set a new step and reset the counts.
  */

  start() {
    ; First step called on `this.run()`
  }
}

; Rename your export accordingly
v2_template := v2TemplateClass()

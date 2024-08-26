#Requires AutoHotkey v2.0

#Include ".\seers.ahk"

class AgilityClass extends v2Helpers {
  name := "Incomplete - Agility"
	setup_img := "..\scripts\v2\agility\setup.png"
  setup_text := "Only working for Seers Course atm.\nStart on the blue tile marked outside seers bank.\nSet your camera top down.\n Select the Agility camera point.\nThen begin."
	mog := "*TransBlack ..\scripts\v2\agility\mog.png"
	camelot_tele := "*TransBlack ..\scripts\v2\agility\camelot_tele.png"
  ; get course selection from dropdown
  course := seers_course
  ; tele for camelot checkbox
  using_camelot_tele := False
  course_ind := 0
  check_magic_book := False
  prev_location := {
    x: "",
    y: "",
    z: "",
  }

  click_camelot_tele() {
    if clickImageIn(this.camelot_tele, "inventory", 4, 4, 4) {
      this.setSkip()
      ; waiting tele timer cast
      randSleep(5500, 6500)
      this.setStep("find_location")
    } else if (!this.check_magic_book) {
      selectTab("magic")
      this.check_magic_book := True
    } else {
      this.throwError()
    }
  }

  minimap_run() {
    this.setSkip()
    step := this.course[this.course_ind]
    for _, item in step.minimap {
      singleClick(item.x, item.y, 3)
      randSleep(item.sleep_for, item.sleep_for + 1000)      
    }
    this.setStep("click_next")
  }

  click_next() {
    if (this.stepCount == 1) {
      return this.incStepCount()
    }
    if (this.stepCount == 2) {
      return this.setStep("find_location")
    }
    item := this.course[this.course_ind]
    if clickColorIn(item.next_color, "game", item.randomizer) {
      debug("clicking step: " . item.label)
      this.incStepCount()
    }
  }

  check_mog() {
    if (this.stepCount == 2) {
      return this.setStep("click_next")
    }
    if (this.stepCount == 1) {
      if findImageIn(&x, &y, this.mog, "game") {
        return
      } else {
        this.incStepCount()
      }
    }
    if findImageIn(&x, &y, this.mog, "game") {
      singleClick(x + 6, y + 8)
      this.incStepCount()
    } else {
      this.setStep("click_next")
    }
  }

  find_location() {
    curr_location := getLocation()
    for ind, item in this.course {
      if (
        item.x == Integer(curr_location.x)
        AND item.y == Integer(curr_location.y)
        AND item.z == Integer(curr_location.z)
      ) {
        this.course_ind := ind
        if (item.HasOwnProp("use_minimap")) {
          ; Special case for camelot tele on seers
          if (this.using_camelot_tele) {
            return this.setStep("click_camelot_tele")
          }
          return this.setStep("minimap_run")
        }
        this.setStep("check_mog")
      }
    }
  }

  am_i_moving() {
    curr_location := getLocation()
    if (
      this.prev_location.x == Integer(curr_location.x)
      AND this.prev_location.y == Integer(curr_location.y)
      AND this.prev_location.z == Integer(curr_location.z)) {
        this.setStep("find_location")
    } else {
      this.prev_location := curr_location
    }
  }

  start() {
    this.setStep("find_location")
  }
}

v2Agility := AgilityClass()

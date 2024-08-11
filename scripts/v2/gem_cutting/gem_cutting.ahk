#Requires AutoHotkey v2.0

class GemCuttingClass extends v2Helpers {
  name := "Gem Cut/Stams/Glass"
	setup_img := "..\scripts\v2\gem_cutting\setup.png"
  setup_text := "Stand next to any banker/booth marked pink (FFFF00FF).\nSet camera top down.\nSet camera point to 'Bank'.\nPut your gem/super energy(4)/glass in the first slot of any bank tab. (Only works on Sapphire through Dragonstone gems)\nSet 'Quantity: All' in bank.\nPut your chisel/crystals/pipe in slot one of your inventory.\nBegin script."
	how_many := "*50 ..\scripts\v2\gem_cutting\how_many.png"
	uncut_sapphire := "*20 ..\scripts\v2\gem_cutting\uncut_sapphire.png"
	uncut_emerald := "*20 ..\scripts\v2\gem_cutting\uncut_emerald.png"
	uncut_ruby := "*20 ..\scripts\v2\gem_cutting\uncut_ruby.png"
	uncut_diamond := "*20 ..\scripts\v2\gem_cutting\uncut_diamond.png"
	uncut_dragonstone := "*20 ..\scripts\v2\gem_cutting\uncut_dragonstone.png"
	super_energy := "*20 ..\scripts\v2\gem_cutting\super_energy.png"
	molten_glass := "*20 ..\scripts\v2\gem_cutting\molten_glass.png"
  imgs_arr := [this.uncut_sapphire, this.uncut_emerald, this.uncut_ruby, this.uncut_diamond, this.uncut_dragonstone, this.super_energy, this.molten_glass]

  checkImage() {
    for ind, img in this.imgs_arr {
      if findImageIn(&_, &_, img, "inventory") {
        return True
      }
    }
    return False
  }

  cut() {
    switch (this.stepCount) {
      case 0:
        if this.checkImage() {
          this.incStepCount()
        }
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
        if not this.checkImage() {
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

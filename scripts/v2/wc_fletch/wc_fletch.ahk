#Requires AutoHotkey v2.0

class WCFletchClass extends v2Helpers {
    name := "WC > Fletching"
    setup_img := "..\scripts\v2\wc_fletch\setup.png"
    setup_text :=
        "Choose a location where your character DOESN'T move between cutting trees.\nMark the trees you want to cut pink (FFFF00FF).\nEquip an axe.\nPlace a knife in slot one of your inventory.\nSet the camera top down, north facing, zoomed out enough to see all marked trees.\nChop and fletch one log.\nBegin script."
    quantity := "*50 ..\scripts\v2\wc_fletch\quantity.png"
    tl := { x: window.game.x, y: window.game.y
    }
    br := { x: this.tl.x + window.game.width, y: this.tl.y + window.game.height
    }
    color_x := -1
    color_y := -1

    wait_for_fletch() {
        this.incTickCount()
        if (this.tickCount > 82) {
            rand := Random(1, 3)
            if (rand == 3) {
                this.setSkip()
                dropInventory([1
                ])
                this.setStep("check_color")
            }
        }
    }

    wait_for_quantity() {
        if findImageIn(&_, &_, this.quantity, "chat") {
            Send("{Space}")
            this.setStep("wait_for_fletch")
        }
    }

    begin_fletch() {
        clickInventory(1)
        clickInventory(5)
        this.setStep("wait_for_quantity")
    }

    check_inv() {
        if isInvSlotEmpty(28) {
            this.setStep("check_color")
        } else {
            this.setStep("begin_fletch")
            this.color_x := -1
            this.color_y := -1
        }
    }

    click_tree() {
        rand := Random(20, 40)
        singleClick(this.color_x + rand, this.color_y + rand)
        this.setStep("check_color")
    }

    check_color() {
        color := PixelGetColor(this.color_x, this.color_y)

        if (color == colors.pink) {
            return this.setStep("check_inv")
        }

        getColorTopLeft(&cx, &cy, this.tl, this.br, colors.pink)

        if (!cx OR !cy) {
            return
        }

        this.color_x := cx
        this.color_y := cy
        this.setStep("click_tree")
    }

    start() {
        this.setStep("check_inv")
    }
}

wc_fletch := WCFletchClass()
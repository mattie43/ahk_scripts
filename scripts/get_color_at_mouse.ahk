#Requires AutoHotkey v2.0

getColorAtMouse() {
    MouseGetPos &MouseX, &MouseY
    debug("Color: " . PixelGetColor(MouseX, MouseY) . " @(" . MouseX . ", " . MouseY . ")" )
}

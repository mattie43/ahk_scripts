#Requires AutoHotkey v2.0

getColor() {
    MouseGetPos &MouseX, &MouseY
    MsgBox "The color at " . MouseX . ", " . MouseY . "is: " . PixelGetColor(MouseX, MouseY)
}

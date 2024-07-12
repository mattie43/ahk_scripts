#Requires AutoHotkey v2.0

#Include ".\helpers\window.ahk"
#MaxThreadsPerHotkey 2

setup()

callback() {
	Click()
	rand := Random(50, 90)
	Sleep(rand)
	Click()
}

x::{
	listenToColorChange(callback)
}

z::Global stopLoop := True

Esc::ExitApp

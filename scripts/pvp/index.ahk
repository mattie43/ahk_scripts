#Requires AutoHotkey v2.0

#Include ".\mage.ahk"
#Include ".\range.ahk"
#Include ".\insta_maul.ahk"

pvpScripts := [
  {
    name: "Range",
    fn: (*) => range(),
    desc: "INCOMPLETE"
  },
  {
    name: "Mage",
    fn: (*) => mage(),
    desc: "INCOMPLETE"
  },
  {
    name: "Insta Maul",
    fn: (*) => instaMaul(),
    desc: "INCOMPLETE"
  },
]
#Requires AutoHotkey v2.0

class SettingsClass {
  settings := ".\settings.txt"

  get() {
    try {
      fileText := FileRead(this.settings)
    } catch {
      ; return "null" if file doesn't exist
      return ""
    }

    splitLines := StrSplit(fileText, "`n")
    newMap := Map()
  
    for _, item in splitLines {
      if (!item) {
        ; skip empty items (should only be last empty space)
        continue
      }
      kv := StrSplit(item, "=")
      newMap.%kv[1]% := kv[2]
    }

    return newMap
  }

  set(obj) {
    settingsFile := FileOpen(this.settings, "w")
    
    for k, v in obj.OwnProps() {
      text := k . "=" . v . "`n"
      settingsFile.Write(text)
    }

    settingsFile.Close()
  }
}

settings := SettingsClass()

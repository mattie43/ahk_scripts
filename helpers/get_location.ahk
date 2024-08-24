#Requires AutoHotkey v2.0

getLocation() {
  num_path_arr := [
    "*20 ..\imgs\numbers\0.bmp",
    "*20 ..\imgs\numbers\1.bmp",
    "*20 ..\imgs\numbers\2.bmp",
    "*20 ..\imgs\numbers\3.bmp",
    "*20 ..\imgs\numbers\4.bmp",
    "*20 ..\imgs\numbers\5.bmp",
    "*20 ..\imgs\numbers\6.bmp",
    "*20 ..\imgs\numbers\7.bmp",
    "*20 ..\imgs\numbers\8.bmp",
    "*20 ..\imgs\numbers\9.bmp",
  ]
  found_locations := []

  for ind, path in num_path_arr {
    ; Location box is hard coded.
    x := 408
    y := 418
    Loop {
      if (x > 495) {
        break
      }
  
      ; Start off where last img was found.
      ; Break if we don't find the current img anymore.
      if ImageSearch(&foundX, &foundY, x, y, 495, 439, path) {
        x := foundX + 6
      } else {
        break
      }
  
      ; Store the found coordinates
      found_locations.Push({
        num: ind - 1,
        x: foundX,
        y: foundY
      })
    }
  }

  ; Sort by x location
  for i, _ in found_locations {
    for j, _ in found_locations {
      if found_locations[i].x < found_locations[j].x {
          temp := found_locations[i]
          found_locations[i] := found_locations[j]
          found_locations[j] := temp
      }
    }
  }
  
  ; Combine num to a single string.
  str := ""
  for _, location in found_locations {
    str := str . location.num
  }

  ; Don't return a valid search if length is incorrect
  if not StrLen(str) == 9 {
    return ""
  }

  return {
    x: SubStr(str, 1, 4),
    y: SubStr(str, 5, 4),
    z: SubStr(str, 9)
  }
}

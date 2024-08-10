#Requires AutoHotkey v2.0

mMove(endX, endY) {
  MouseGetPos(&startX, &startY)

  ; Calculate the total distance
  distance := Sqrt((endX - startX) ** 2 + (endY - startY) ** 2)

  ; Calculate direction vector
  dirX := (endX - startX) / distance
  dirY := (endY - startY) / distance

  ; Initialize current position
  currentX := startX
  currentY := startY

  ; Move the mouse one pixel at a time
  Loop {
      ; Increment the current position by one unit in the direction of the vector
      currentX += dirX
      currentY += dirY
      
      ; Move the mouse to the current position
      MouseMove(currentX, currentY, 0)  ; The last parameter '0' is the speed (instantaneous)
      
      ; Break the loop when the mouse reaches the end position
      if (Round(currentX) = endX and Round(currentY) = endY)
          break

      ; Optional: Add a small delay to control the speed
      Sleep(.1)  ; Adjust the delay as necessary
  }
}

ocrTest() {
  result := OCR.FromRect(516, 73, 43, 30)
  debug(result.Text)
}
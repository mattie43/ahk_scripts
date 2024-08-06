#Requires AutoHotkey v2.0

ocrTest() {
  result := OCR.FromRect(516, 73, 43, 30)
  debug(result.Text)
}
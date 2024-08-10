#Requires AutoHotkey v2.0

SendMsgToDiscord(msg){
  url := FileRead("webhook.txt")

  if not (url) OR not (msg) {
    return
  }

  RunWait("webhook.bat " . url . " " . msg)
  activateRunelite()
}

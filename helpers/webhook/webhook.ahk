#Requires AutoHotkey v2.0

SendMsgToDiscord(msg){
  url := FileRead("..\helpers\webhook\webhook.txt")

  if (!url) OR (!msg) {
    return
  }

  RunWait("..\helpers\webhook\webhook.bat " . url . ' "' . msg . '"')
  activateRunelite()
}

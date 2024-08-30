#Requires AutoHotkey v2.0

class GETrackerClass {
  ; Provided by https://oldschool.runescape.wiki/w/RuneScape:Real-time_Prices
  base_url := "https://prices.runescape.wiki/api/v1/osrs"
  user_agent := ""

  __New() {
    try {
      user_agent := FileRead("..\helpers\ge_tracker\ge_tracker.txt")
    } catch {
      ; do nothing
    }
  }

  getLatest() {
    resp := this.get(this.base_url . "/latest")
    json := Jxon_Load(&resp)
    obj := json["data"]
    return obj
  }

  getId(id) {
    if (!isNumber(id)) {
      throw ValueError("Parameter must be a Number", -1, id)
    }
    resp := this.get(this.base_url . "/latest?id=" . id)
    OutputDebug(resp)
    json := Jxon_Load(&resp)
    obj := json["data"]["" . id]
    obj["id"] := id
    return obj
  }

  get(url) {
    if (!url) OR (!this.user_agent) {
      return
    }
    comObj := ComObject("WinHTTP.WinHttpRequest.5.1")
    comObj.Open("GET", url, true)
    comObj.SetRequestHeader("User-Agent", this.user_agent)
    comObj.Send()
    comObj.WaitForResponse()
    return comObj.ResponseText
  }
}

ge_tracker := GETrackerClass()

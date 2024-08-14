#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreads 2

Loop {
  shouldBreak := A_Args[1]

  Send("{Space}")
  rand := Random(35,45)
  Sleep(rand)

  if (shouldBreak) {
    break
  }
}

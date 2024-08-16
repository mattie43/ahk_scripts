@echo off
git stash
git pull
START AutoHotKey ".\controls\gui.ahk"
exit
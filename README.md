# Mattie's AHK Scripts for OSRS

## Info
These scripts require AHK v2.  
Running through the batch requires you to have git installed.  
Follow the steps below to set up these scripts.

## Downloads
AHK v2 download: https://www.autohotkey.com/v2/  
Git download: https://git-scm.com/downloads

## Clone this repo
1. Open a GIT Bash, Terminal, Powershell, or Command Prompt where you want to save this project (Right-Click Desktop for ease, can move the folder later).  
![GIT Bash](./imgs/readme/git_bash.png)  
2. Copy and paste this code into your terminal  
```
git clone https://github.com/mattie43/ahk_scripts.git
```  
3. Press Enter. You should now see a folder named ahk_scripts in the same directory.

## Batch file setup
You need to create a PATH in your env variables for "AutoHotKey".

1. Open settings and search for "system variables".  
![System Variables](./imgs/readme/system_variables.png)
2. Click "Environment Variables..." button.  
![Env Variables Btn](./imgs/readme/env_variables_btn.png)
3. Double click "Path" from System variables section.  
![System Variables Path](./imgs/readme/system_variables_path.png)
4. Select "New" and paste your FOLDER where "AutoHotkey.exe" is located (Make sure it is the v2 .exe). The default path for AHK is "C:\Program Files\AutoHotkey\v2".  
![New Button](./imgs/readme/new_button.png)
5. You can press "OK" on all open modals to finish.  
![Finish Button](./imgs/readme/finish_button.png)
6. You can now run `run.bat` inside your ahk_scripts folder to stay up to date and open the program.  
![Run Batch](./imgs/readme/run_batch.png)

## Runescape setup
Make sure to have these options selected within Runescape's in-game settings.

![Layout](./imgs/readme/layout.png)  
![Shift Drop](./imgs/readme/shift_drop.png)  
![Esc Close](./imgs/readme/esc_close.png)  
![Brightness](./imgs/readme/brightness.png)  
![Disable Level Up](./imgs/readme/disable_level_up.png)  
![Hide Roofs](./imgs/readme/hide_roofs.png)

These are optional QOL settings you can also add.

![Ammo Pickup](./imgs/readme/ammo_pickup.png)  
![Trade Delay](./imgs/readme/trade_delay.png)  
![World Switcher](./imgs/readme/world_switcher.png)

## RuneLite setup
Import the profile that came with this repo (runelite-profile.properties)  
You can rename it if you would like.

![Import Profile](./imgs/readme/import_profile.png)

This will be the profile you must use with all scripts.  
Runelite will not auto update this import when you pull an update from this repo.  
You will need to re-import each time a new script is added that you want to use.

## Time to run a script
Here are some points to cover about the program:

1. In red is how you setup the bot before starting any scripts. This is how the window, game, chat, and inventory positions are set.
2. In yellow is where the camera point plugin is. Many scripts will use this to get the correct camera setup.
3. In green is the button to load the specific camera point. "Smithing" in this example.
4. In blue is the screen marker plugin. Some plugins may have you put a screen marker on an item in your bank if it can vary for an individual script.

![Lets Begin](./imgs/readme/lets_begin.png)

1. There are multiple types of scripts highlighted in green, seperated by tabs.
2. In blue is the hotkey button. After you click on it, it will listen for the next keybord press (exluding Tab and Space). If you press Esc, it will reset the current hotkey. Once a hotkey is set, make sure you are focused on RuneLite, then press your hotkey to toggle starting and stopping your script.
3. In red is the "debug" section. When starting or stopping a script, or an error occuring, it will print out what it can for useful information.

![Smithing Example](./imgs/readme/smithing_example.png)

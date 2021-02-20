# mpv-scripts

A few useful scripts for [mpv player](https://github.com/mpv-player/mpv)

## Installation

Copy scripts into your `scripts` directory:

Mac/Linux: `~/.config/mpv/scripts/`<br>
Windows: `%APPDATA%\mpv\scripts\`

More info on mpv file locations: https://mpv.io/manual/master/#files

## Changing default keybindings

A custom keybinding can be set by adding a line like this to your `input.conf` file:<br>
`<key> script-binding <name>`

Substitute `<key>` and `<name>` with the values specified in each script's individual `README.md` file in the section *Default keybindings*.

This, however, will not remove any default keybindings. It will only add a new one.<br>
A default keybinding can be removed with a line like this added to the same file:
`<key> ignore`

`input.conf` is located in the mpv configurations files directory:

Mac/Linux: `~/.mpv/input.conf` or `~/.config/mpv/input.conf`<br>
Windows: `%APPDATA%\mpv\input.conf`

More info on mpv file locations and changing keybindings via the `input.conf` file:<br>
https://mpv.io/manual/master/#files<br>
https://mpv.io/manual/master/#input-conf

# osc-show-hide.lua

Show or hide the on-screen controller.

Video tutorial:

[![Video tutorial](https://img.youtube.com/vi/Pp3a5O5OI9U/0.jpg)](https://youtu.be/Pp3a5O5OI9U&t=1m06s)

## Options

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=6m01s)

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `osc_show_hide`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

NOTE: The table below shows values as they appear in the script's source code written in Lua. When passing script options on the command line, or setting them in a config file, in `mpv` you use the words `yes` and `no` instead of Lua's `true` and `false`, respectively.

The following options are available for this script:

| Option | Default value | Description |
| --- | --- | --- |
| `hidden_mode` | `'never'` | Accepted values are `'never'` or `'auto'`. |

## Keybindings

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=12m44s)

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

If you remap a keybinding, you will likely want to disable the default keybinding by adding `<default key> ignore` to `~/.config/mpv/input.conf`. See the video tutorial linked to above for a demonstration and for information on how to [see what a given key is currently mapped to](https://youtu.be/rm1cSU88U2Y&t=15m06s) in `mpv`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `/` | `osc-show-hide` |

## License

[GNU General Public License v3.0](LICENSE)

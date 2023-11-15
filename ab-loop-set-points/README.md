# ab-loop-set-points.lua

Set start and end points of an A/B loop.

Video tutorial:

[![Video tutorial](https://img.youtube.com/vi/spf0cU3P3SI/0.jpg)](https://youtu.be/spf0cU3P3SI&t=1m53s)

## Options

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=6m01s)

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `ab_loop_set_points`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

NOTE: The table below shows values as they appear in the script's source code written in Lua. When passing script options on the command line, or setting them in a config file, in `mpv` you use the words `yes` and `no` instead of Lua's `true` and `false`, respectively.

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `toggle_seek_back` | `true` |
| `toggle_seek_forward` | `false` |
| `console_message` | `false` |

## Keybindings

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=12m44s)

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

If you remap a keybinding, you will likely want to disable the default keybinding by adding `<default key> ignore` to `~/.config/mpv/input.conf`. See the video tutorial linked to above for a demonstration and for information on how to [see what a given key is currently mapped to](https://youtu.be/rm1cSU88U2Y&t=15m06s) in `mpv`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `:` | `ab-loop-set-a` |
| `"` | `ab-loop-set-b` |
| `Alt+L` | `ab-loop-set-sub` |
| `Alt+:` | `ab-loop-set-a-sub` |
| `Alt+"` | `ab-loop-set-b-sub` |
| `\|` | `ab-loop-show` |
| `Alt+\|` | `ab-loop-clear` |
| `L` | `ab-loop-toggle` |

## License

[GNU General Public License v3.0](LICENSE)

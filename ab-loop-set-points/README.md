# ab-loop-set-points.lua

Set start and end points of an A/B loop.

## Options

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `ab_loop_set_points`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `toggle_seek_back` | `true` |
| `toggle_seek_forward` | `false` |
| `console_message` | `false` |

## Keybindings

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `:` | `ab-loop-set-a` |
| `"` | `ab-loop-set-b` |
| `Alt+L` | `ab-loop-set-sub` |
| `Alt+:` | `ab-loop-set-a-sub` |
| `Alt+"` | `ab-loop-set-b-sub` |
| `|` | `ab-loop-show` |
| `Alt+|` | `ab-loop-clear` |
| `L` | `ab-loop-toggle` |

## License

[GNU General Public License v3.0](LICENSE)

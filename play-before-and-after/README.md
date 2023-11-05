# play-before-and-after.lua

Play an interval before or after the current position.

## Options

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `play_before_and_after`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `interval_short` | `3` |
| `interval_medium` | `5` |
| `interval_long` | `10` |

## Keybindings

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `Ctrl+,` | `play-before-short` |
| `Ctrl+.` | `play-after-short` |
| `<` | `play-before-medium` |
| `>` | `play-after-medium` |
| `Ctrl+<` | `play-before-long` |
| `Ctrl+>` | `play-after-long` |

## License

[GNU General Public License v3.0](LICENSE)

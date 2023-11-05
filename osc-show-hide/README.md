# osc-show-hide.lua

Show or hide the on-screen controller.

## Options

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `osc_show_hide`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

The following options are available for this script:

| Option | Default value | Description |
| --- | --- | --- |
| `hidden_mode` | `'never'` | Accepted values are `'never'` or `'auto'`. |

## Keybindings

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `/` | `osc-show-hide` |

## License

[GNU General Public License v3.0](LICENSE)

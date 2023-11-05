# clock.lua

Show clock on the screen.

## Options

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `clock`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

The following options are available for this script:

| Option | Default value | Description |
| --- | --- | --- |
| `font` | `'VCR OSD Mono'` | The _VCR OSD Mono_ font can be downloaded here: https://www.dafont.com/vcr-osd-mono.font |
| `font_size` | `50` |  |
| `clock_position_x` | `-327` | Negative values indicate offset from the right. |
| `clock_position_y` | `100` | Negative values indicate offset from the bottom. |
| `datetime_format` | `'%H:%M:%S'` | For a list of special character sequences, see https://www.lua.org/pil/22.1.html, or run `man strftime` in your terminal. |
| `update_timeout` | `1` |  |
| `show_on_start` | `false` |  |

## Keybindings

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `?` | `clock-show-hide` |

## License and attributions

This is a derivative work of the [code from mozbugbox](https://gitlab.com/mozbugbox/mpv-script-mozbugbox/-/blob/6c2e7f0ac2faa19563bf6f9d08d182371180758c/clock.lua), which is licensed under GNU GPL v3. This code therefore is also licensed under the terms of the [GNU General Public License v3](LICENSE).

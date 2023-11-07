# ab-loop-to-edl-segment.lua

Convert an A/B loop to an [EDL](https://github.com/mpv-player/mpv/blob/master/DOCS/edl-mpv.rst) segment.

## Dependencies and running this script on different OSes

This script needs to run an external command in order to copy text to the clipboard.

That command is set with the `clipboard_command` option, which has the default value of `'xclip -rmlastnl -selection clipboard'`. See the [_Options_](#options) section for more information.

On Linux, if you don't already have `xclip` installed, you can install it with your distribution's package manager (e.g. on Debian, run `sudo apt install xclip`).

On macOS, set the `clipboard_command` option to `pbcopy`.

On Windows, a modification to the script is required. An imperfect example can be found in a previous commit, [here](https://github.com/linguisticmind/mpv-scripts/blob/9d42934a319eb94226abde0851fd4548bc8463a2/copy-subtitle/win/copy-subtitle.lua). Since I don't run Windows, I won't be able to provide much support regarding this issue, but if someone knows a robust solution to this, I would be glad to hear from you. Take a look at this [_Issues_ thread](https://github.com/linguisticmind/mpv-scripts/issues/1) for more information.

## Options

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `ab_loop_to_edl_segment`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `output_filename` | `''` |
| `default_output_filename` | `'edit.edl'` |
| `write_to_default_output_file` | `false` |
| `absolute_path_by_default` | `false` |
| `console_message` | `false` |
| `clipboard_command` | `'xclip -rmlastnl -selection clipboard'` |

## Keybindings

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `Ctrl+x` | `ab-loop-to-edl-segment-copy-path` |
| `Ctrl+Alt+x` | `ab-loop-to-edl-segment-copy-path-alternate` |
| `Ctrl+v` | `ab-loop-to-edl-segment-write-path` |
| `Ctrl+Alt+v` | `ab-loop-to-edl-segment-write-path-alternate` |

## License

[GNU General Public License v3.0](LICENSE)

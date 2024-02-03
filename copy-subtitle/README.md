# copy-subtitle.lua

Copy current subtitle to clipboard.

Video tutorial:

[![Video tutorial](https://img.youtube.com/vi/SSL9wm2l5SQ/0.jpg)](https://youtu.be/SSL9wm2l5SQ&t=6m57s)

## Dependencies and running this script on different OSes

[**Video commentary**](https://youtu.be/SSL9wm2l5SQ&t=0:58)

This script needs to run an external command in order to copy text to the clipboard.

That command is set with the `clipboard_command` option, which has the default value of `'xclip -rmlastnl -selection clipboard'`. See the [_Options_](#options) section for more information.

### Linux
1. Determine whether your display server is X11 or Wayland.
2. Use `xclip` or `wl-copy` respectively. The script preset is X11's `xclip`.
    - **If X11**: Ensure `xclip` is installed.
    - **If Wayland**: Ensure `wl-clipboard` is installed. Change `clipboard_command` to `'wl-copy'`

### macOS
On macOS, set the `clipboard_command` option to `pbcopy`.

### Windows
On Windows, a modification to the script is required. An imperfect example can be found in a previous commit, [here](https://github.com/linguisticmind/mpv-scripts/blob/9d42934a319eb94226abde0851fd4548bc8463a2/copy-subtitle/win/copy-subtitle.lua). Since I don't run Windows, I won't be able to provide much support regarding this issue, but if someone knows a robust solution to this, I would be glad to hear from you. Take a look at this [_Issues_ thread](https://github.com/linguisticmind/mpv-scripts/issues/1) for more information.

## Options

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=6m01s)

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `copy_subtitle`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

NOTE: The table below shows values as they appear in the script's source code written in Lua. When passing script options on the command line, or setting them in a config file, in `mpv` you use the words `yes` and `no` instead of Lua's `true` and `false`, respectively.

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `console_message` | `true` |
| `console_message_print_copied` | `true` |
| `osd_message` | `true` |
| `osd_message_print_copied` | `false` |
| `osd_warning_nothing_to_copy` | `'always'` |
| `clipboard_command` | `'xclip -rmlastnl -selection clipboard'` |

## Keybindings

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=12m44s)

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

If you remap a keybinding, you will likely want to disable the default keybinding by adding `<default key> ignore` to `~/.config/mpv/input.conf`. See the video tutorial linked to above for a demonstration and for information on how to [see what a given key is currently mapped to](https://youtu.be/rm1cSU88U2Y&t=15m06s) in `mpv`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `Ctrl+c` | `copy-subtitle-primary` |
| `Ctrl+C` | `copy-subtitle-primary-ass` |
| `Ctrl+Alt+c` | `copy-subtitle-secondary` |

## License

[GNU General Public License v3.0](LICENSE)

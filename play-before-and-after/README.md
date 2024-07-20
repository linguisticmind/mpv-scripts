# play-before-and-after.lua

Play an interval before or after the current position.

Video tutorial:

[![Video tutorial](https://img.youtube.com/vi/spf0cU3P3SI/0.jpg)](https://youtu.be/spf0cU3P3SI&t=10m48s)

<a href='https://ko-fi.com/linguisticmind'><img src='https://github.com/linguisticmind/linguisticmind/raw/master/res/kofi/kofi_donate_1.svg' alt='Support me on Ko-fi' height='48'></a>

## Options

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=6m01s)

Options can be set either on the command line, or in a config file.

In both cases, this script's identifier&nbsp;&ndash; `play_before_and_after`&nbsp;&ndash; will be needed.

Use `--script-opts=<identifier>-<option>=<value>,...` to set options on the command line.

To set options in a config file, create the following file: `~/.config/mpv/script-opts/<identifier>.conf`. Set options in the file, one per line, in the following fashion: `<option>=<value>`.

More information on `mpv`'s `script-opts` command line and config file syntax can be found [here](https://mpv.io/manual/stable/#configuration) (based on the example of the built-in [`osc.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) script).

NOTE: The table below shows values as they appear in the script's source code written in Lua. When passing script options on the command line, or setting them in a config file, in `mpv` you use the words `yes` and `no` instead of Lua's `true` and `false`, respectively.

The following options are available for this script:

| Option | Default value |
| --- | --- |
| `interval_short` | `3` |
| `interval_medium` | `5` |
| `interval_long` | `10` |

## Keybindings

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=12m44s)

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

If you remap a keybinding, you will likely want to disable the default keybinding by adding `<default key> ignore` to `~/.config/mpv/input.conf`. See the video tutorial linked to above for a demonstration and for information on how to [see what a given key is currently mapped to](https://youtu.be/rm1cSU88U2Y&t=15m06s) in `mpv`.

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

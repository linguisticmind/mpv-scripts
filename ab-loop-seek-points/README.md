# ab-loop-seek-points.lua

Seek to start and end points of an A/B loop.

Video tutorial:

[![Video tutorial](https://img.youtube.com/vi/spf0cU3P3SI/0.jpg)](https://youtu.be/spf0cU3P3SI&t=9m40s)

## Keybindings

[**Video tutorial**](https://youtu.be/rm1cSU88U2Y&t=12m44s)

Keybindings can be remapped in `~/.config/mpv/input.conf`. Add a line in the following format to remap a keybinding: `<key> script-binding <name>`.

If you remap a keybinding, you will likely want to disable the default keybinding by adding `<default key> ignore` to `~/.config/mpv/input.conf`. See the video tutorial linked to above for a demonstration and for information on how to [see what a given key is currently mapped to](https://youtu.be/rm1cSU88U2Y&t=15m06s) in `mpv`.

The following keybindings are available for this script:

| Key | Name |
| --- | --- |
| `Ctrl+;` | `ab-loop-seek-a` |
| `Ctrl+'` | `ab-loop-seek-b` |

## License

[GNU General Public License v3.0](LICENSE)

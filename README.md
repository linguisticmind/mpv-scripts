# mpv-scripts

A collection of scripts for [`mpv`](https://github.com/mpv-player/mpv) media player.

<a id='toc'></a>
The following scripts are available:

| Name | Description |
| --- | --- | 
| [`ab-loop-seek-points.lua`](ab-loop-seek-points) | Seek to start and end points of an A/B loop. |
| [`ab-loop-set-points.lua`](ab-loop-set-points) | Set start and end points of an A/B loop. |
| [`ab-loop-to-edl-segment.lua`](ab-loop-to-edl-segment) | Convert an A/B loop to an EDL segment. |
| [`clock.lua`](clock) | Show clock on the screen. |
| [`copy-filename.lua`](copy-filename) | Copy current file's name or path to clipboard. |
| [`copy-subtitle.lua`](copy-subtitle) | Copy current subtitle to clipboard. |
| [`copy-timestamp.lua`](copy-timestamp) | Copy current timestamp to clipboard. |
| [`osc-show-hide.lua`](osc-show-hide) | Show or hide the on-screen controller. |
| [`play-before-and-after.lua`](play-before-and-after) | Play an interval before or after the current position. |

## Dependencies

[`ab-loop-to-edl-range.lua`](ab-loop-to-edl-range), [`copy-filename.lua`](copy-filename), [`copy-subtitle.lua`](copy-subtitle) and [`copy-timestamp.lua`](copy-timestamp) require `xclip` or another clipboard command to copy text to clipboard. Refer to those scripts' `README`s  for more information.

## Installation

1. Clone this repository to a directory of your choice (e.g. `~/repos`):

    ```bash
    cd ~/repos
    git clone https://github.com/linguisticmind/mpv-scripts.git
    ```

2. Symlink or copy the script files to `~/.config/mpv/mpv-scripts`:

    ```bash
    cd ~/.config/mpv/scripts

    # To symlink

    # all scripts
    ln -sv ~/repos/mpv-scripts/*/*.lua .
    # individual scripts (e.g. `copy-subtitle.lua` and `copy-timestamp.lua`)
    ln -sv ~/repos/mpv-scripts/copy-subtitle/copy-subtitle.lua ~/repos/mpv-scripts/copy-timestamp/copy-timestamp.lua .

    # To copy

    # all scripts
    cp -av ~/repos/mpv-scripts/*/*.lua .
    # individual scripts (e.g. `copy-subtitle.lua` and `copy-timestamp.lua`)
    cp -av ~/repos/mpv-scripts/copy-subtitle/copy-subtitle.lua ~/repos/mpv-scripts/copy-timestamp/copy-timestamp.lua .
    ```

## Versioning

The [individual scripts](#toc) follow the [Semantic Versioning](https://semver.org/) convention. The version number is indicated in the script file&nbsp;&ndash; in a comment immediately preceding the main code, in the following format: `-- version: <version number>` (e.g. `-- version: 0.1.0`). This comment may be separated from the main code and/or any preceding text with any number of lines that are empty or only contain whitespace.

The [entire script collection](https://github.com/linguisticmind/mpv-scripts) follows [Calendar Versioning](https://calver.org/) in the following format: `YYYY0M0D.MICRO`. In this versioning scheme, the collection can get _patch_ and _major_ releases. When _patch_ and _major_ releases of the collection occur, depends on the kind of updates that were done to the individual scripts:

<dl>
    <dt>Patch release</dt>
    <!--
    Each time at least one script gets a [`PATCH`](https://semver.org/#summary) update, [`MICRO`](https://calver.org/#scheme) of the entire collectionis incremented by 1..
    -->
    <dd>Each time at least one script gets a <a href='https://semver.org/#summary'><code>PATCH</code></a> update, <a href='https://calver.org/#scheme'><code>MICRO</code></a> of the entire collection is incremented by 1.</dd>
    <dt>Major release</dt>
    <!--
    Each time at least one script gets a [`MAJOR`](https://semver.org/#summary) or [`MINOR`](https://semver.org/#summary) update, [`MAJOR` (`YYYY0M0D`)](https://calver.org/#scheme) of the entire collection is updated (and [`MICRO`](https://calver.org/#scheme) is reset to `0`). [`MAJOR` (`YYYY0M0D`)](https://calver.org/#scheme) is the date of a git commit of a given _major_ release of the collection, in UTC.
    -->
    <dd>Each time at least one script gets a <a href='https://semver.org/#summary'><code>MAJOR</code></a> or <a href='https://semver.org/#summary'><code>MINOR</code></a> update, <a href='https://calver.org/#scheme'><code>MAJOR</code> (<code>YYYY0M0D</code>)</a> of the entire collection is updated, and <a href='https://calver.org/#scheme'><code>MICRO</code></a> is reset to <code>0</code>. <a href='https://calver.org/#scheme'><code>MAJOR</code> (<code>YYYY0M0D</code>)</a> is the date of a git commit of a given <i>major</i> release of the collection, in UTC.</dd>
</dl>

## License

For license information refer to [directories for individual scripts](#toc).

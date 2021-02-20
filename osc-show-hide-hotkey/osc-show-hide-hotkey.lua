-- osc-show-hide-hotkey

-- Shows and hides the OSC (On Screen Controller) with a keypress
-- Achieved by cycling 'osc-visibility auto' and 'osc-visibility always'

-------------------------------------------------------------------------------
-- Script adapted by Alex Rogers (https://github.com/linguisticmind)
-- Based on information in this post:
-- https://github.com/mpv-player/mpv/issues/4896#issuecomment-330458533

local is_auto = true  -- no way to read the osc mode,
                      -- so we assume it starts in auto mode.

function show_hide_osc ()
  is_auto = not is_auto
  mp.command(
    "script-message osc-visibility "
    .. (is_auto and "auto" or "always") .. " no-osd"
  )
end

mp.add_key_binding("/", "osc-show-hide-hotkey", show_hide_osc)

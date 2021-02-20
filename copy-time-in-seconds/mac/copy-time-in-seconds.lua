-- copy-time-in-seconds (Mac version)

-- Copies current timecode in S.MS format to clipboard

-------------------------------------------------------------------------------
-- Script adapted by Alex Rogers (https://github.com/linguisticmind)
-- Modified from https://github.com/Arieleg/mpv-copyTime
-- Released under GNU GPL 3.0

require "mp"

local function set_clipboard(text)
  command = string.format("echo -n %s | pbcopy", text)
  mp.commandv("run", "/bin/bash", "-c",  command)
end

function copy_time()
  local time_pos = mp.get_property_number("time-pos")
  time_seg,time_ms=string.format("%.03f", time_pos):match"([^.]*).(.*)"
  time = string.format("%d.%s", time_seg, time_ms)
  set_clipboard(time)
  mp.osd_message(string.format("Copied to clipboard: %s", time))
end

mp.add_key_binding("Meta+C", "copy-time-in-seconds", copy_time)

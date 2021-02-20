-- copy-time-in-seconds (Windows version)

-- Copies current timecode in S.MS format to clipboard

-------------------------------------------------------------------------------
-- Script adapted by Alex Rogers (https://github.com/linguisticmind)
-- Modified from https://github.com/Arieleg/mpv-copyTime
-- Released under GNU GPL 3.0

require "mp"

function set_clipboard (text)
  local echo
  if text ~= "" then
    for i = 1, 2 do text = text:gsub("[%^&\\<>|]", "^%0") end
    echo = "(echo " .. text:gsub("\n", " & echo ") .. ")"
  else
    echo = "echo:"
  end
  mp.commandv("run", "cmd.exe", "/d", "/c", echo .. " | clip")
end

function copy_time()
  local time_pos = mp.get_property_number("time-pos")
  time_seg,time_ms=string.format("%.03f", time_pos):match"([^.]*).(.*)"
  time = string.format("%d.%s", time_seg, time_ms)
  set_clipboard(time)
  mp.osd_message(string.format("Copied to clipboard: %s", time))
end

mp.add_key_binding("Ctrl+C", "copy-time-in-seconds", copy_time)

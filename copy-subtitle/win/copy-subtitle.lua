-- copy-subtitle (Windows version)

-- Copies current subtitle line to clipboard

-------------------------------------------------------------------------------
-- Script by Alex Rogers (https://github.com/linguisticmind)
-- Released under GNU GPL 3.0

-- Linguistic Mind - Language learning resources, tools and tutorials
-- YouTube: https://www.youtube.com/channel/UCZ_2W3ilvrS-20rk1reNIZA
-- Patreon: https://www.patreon.com/linguisticmind

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

function copy_subtitle ()
  local subtitle = mp.get_property("sub-text")
  set_clipboard(subtitle)
  mp.osd_message("Subtitle line copied to clipboard")
end

mp.add_key_binding("Ctrl+c", "copy-subtitle", copy_subtitle)

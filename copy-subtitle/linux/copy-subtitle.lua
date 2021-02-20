-- copy-subtitle (Linux version)
-- Requires xclip installed

-- Copies current subtitle line to clipboard

-------------------------------------------------------------------------------
-- Script by Alex Rogers (https://github.com/linguisticmind)
-- Released under GNU GPL 3.0

-- Linguistic Mind - Language learning resources, tools and tutorials
-- YouTube: https://www.youtube.com/channel/UCZ_2W3ilvrS-20rk1reNIZA
-- Patreon: https://www.patreon.com/linguisticmind

require "mp"

function copy_subtitle ()
  local subtitle = mp.get_property("sub-text")
  mp.commandv(
    "run", "/bin/bash", "-c",
    "echo -n \"" .. subtitle:gsub("\"", "\\%0") .. "\" | LANG=en_US.UTF-8 xclip -selection clipboard"
  )
  mp.osd_message("Subtitle line copied to clipboard")
end

mp.add_key_binding("Ctrl+c", "copy-subtitle", copy_subtitle)

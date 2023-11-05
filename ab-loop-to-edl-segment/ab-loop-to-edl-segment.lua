-- ab-loop-to-edl-segment.lua - convert an A/B loop to an EDL segment (a script for mpv player)
-- copyright (c) 2023  Alex Rogers <https://github.com/linguisticmind>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

-- version: 0.1.0

require('mp.options')

local options = {
  output_filename = '',
  default_output_filename = 'edit.edl',
  write_to_default_output_file = false,
  absolute_path_by_default = false,
  console_message = false,
  clipboard_command = 'xclip -rmlastnl -selection clipboard',
}

read_options(options, 'ab_loop_to_edl_segment')

local function print_message(msg)
  if options.console_message == true then print(msg) end
  mp.osd_message(msg)
end

--

local function copy_to_clipboard(text)
  mp.commandv(
    'run', '/usr/bin/env', 'bash', '-c',
    string.format("<<<'%s' LANG=en_US.UTF-8 %s", text:gsub("'", "'\\''"), options.clipboard_command)
  )
  print_message("Copied to clipboard: " .. text)
end

local function append_to_file(text)

  local output_filename = options.output_filename

  if output_filename == '' then
    if options.write_to_default_output_file == true then
      output_filename = options.default_output_filename
    else
      print_message("No output filename specified.")
      return
    end
  end

  local file = io.open(output_filename, 'r')
  if file then file:close() end

  if not file then
    file = io.open(output_filename, 'w')
    file:write('# mpv EDL v0\n\n')
  else
    file = io.open(output_filename, 'a')
  end

  file:write(text .. '\n')
  file:close()

  print_message("Appended to '" .. output_filename .. "': " .. text)

end

local function timecode_from_seconds(t)
  if t == 'no' then return t end
  local s_ms = t % 60
  local r = t - s_ms
  local h = math.floor(r / 3600)
  r = r - (h * 3600)
  local m = r / 60
  local s, ms = string.format('%.03f', s_ms):match('([^.]*).(.*)')
  return string.format('%02d:%02d:%02d.%03d', h, m, s, ms)
end

--

local function ab_loop_to_edl_range(arg)

  arg = arg or {}
  arg.absolute_path = arg.absolute_path or false
  arg.copy_to_clipboard = arg.copy_to_clipboard or false
  arg.append_to_file = arg.append_to_file or false

  local path
  if arg.absolute_path == false then
    path = mp.get_property('path')
  else
    path = mp.get_property('working-directory') .. '/' .. mp.get_property('path')
  end

  local start = mp.get_property_native('ab-loop-a')
  local end_ = mp.get_property_native('ab-loop-b')
  if start == 'no' and end_ ~= 'no' then
    start = mp.get_property_native('time-pos')
  elseif start ~= 'no' and end_ == 'no' then
    end_ = mp.get_property_native('time-pos')
  elseif start == 'no' and end_ == 'no' then
    start = mp.get_property_native('time-pos')
    end_ = mp.get_property_native('duration')
  end
  if start > end_ then start, end_ = end_, start end
  local length = end_ - start
  local title = mp.get_property('filename') .. ' - ' .. timecode_from_seconds(start) .. '-' .. timecode_from_seconds(end_)

  local output =
  '# ' .. title .. '\n' ..
  '%' .. #path .. '%' .. path .. ',' .. start .. ',' .. length .. ',title=%' .. #title .. '%' .. title

  if arg.copy_to_clipboard == true then copy_to_clipboard(output) end
  if arg.append_to_file == true then append_to_file(output) end

end

--

mp.add_key_binding(
  'Ctrl+x', 'ab-loop-to-edl-range-copy-path',
  function()
    if options.absolute_path_by_default == false then
      ab_loop_to_edl_range{absolute_path = false, copy_to_clipboard = true}
    else
      ab_loop_to_edl_range{absolute_path = true, copy_to_clipboard = true}
    end
  end
)

mp.add_key_binding(
  'Ctrl+Alt+x', 'ab-loop-to-edl-range-copy-path-alternate',
  function()
    if options.absolute_path_by_default == false then
      ab_loop_to_edl_range{absolute_path = true, copy_to_clipboard = true}
    else
      ab_loop_to_edl_range{absolute_path = false, copy_to_clipboard = true}
    end
  end
)

mp.add_key_binding(
  'Ctrl+v', 'ab-loop-to-edl-range-write-path',
  function()
    if options.absolute_path_by_default == false then
      ab_loop_to_edl_range{absolute_path = false, append_to_file = true}
    else
      ab_loop_to_edl_range{absolute_path = true, append_to_file = true}
    end
  end
)

mp.add_key_binding(
  'Ctrl+Alt+v', 'ab-loop-to-edl-range-write-path-alternate',
  function()
    if options.absolute_path_by_default == false then
      ab_loop_to_edl_range{absolute_path = true, append_to_file = true}
    else
      ab_loop_to_edl_range{absolute_path = false, append_to_file = true}
    end
  end
)

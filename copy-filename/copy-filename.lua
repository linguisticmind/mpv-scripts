-- copy-filename.lua - copy current file's name or path to clipboard (a script for mpv player)
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

-- Video tutorial: https://youtu.be/SSL9wm2l5SQ&t=14m25s

-- version: 0.1.1

require('mp.options')

local options = {
  console_message = true,
  console_message_print_copied = true,
  osd_message = true,
  osd_message_print_copied = true,
  clipboard_command = 'xclip -rmlastnl -selection clipboard',
}

read_options(options, 'copy_subtitle')

local function copy_filename(arg)

  arg = arg or {}

  arg.filename_format = arg.filename_format or 'basename'

  local result

  local function get_relative_path()
    return mp.get_property('path'):gsub(mp.get_property('working-directory'):gsub('%%', '%%%%') .. '/', '', 1)
  end

  if arg.filename_format == 'basename' then
    result = mp.get_property('filename')
  elseif arg.filename_format == 'relative_path' then
    result = get_relative_path()
  elseif arg.filename_format == 'absolute_path' then
    result = string.format('%s/%s', mp.get_property('working-directory'), get_relative_path())
  end

  mp.commandv(
    'run', '/usr/bin/env', 'bash', '-c',
    string.format("<<<'%s' LANG=en_US.UTF-8 %s", result:gsub("'", "'\\''"), options.clipboard_command)
  )

  if options.console_message == true then
    if options.console_message_print_copied == true then
      print(string.format('Copied %s to clipboard:\n%s', arg.filename_format:gsub('_', ' '), result))
    else
      print(string.format('Copied %s to clipboard', arg.filename_format:gsub('_', ' ')))
    end
  end

  if options.osd_message == true then
    if options.osd_message_print_copied == true then
      mp.osd_message(string.format('Copied %s to clipboard: %s', arg.filename_format:gsub('_', ' '), result))
    else
      mp.osd_message(string.format('Copied %s to clipboard', arg.filename_format:gsub('_', ' ')))
    end
  end

end

mp.add_key_binding('Ctrl+z', 'copy-filename-basename', function() copy_filename{ filename_format = 'basename' } end)
mp.add_key_binding('Ctrl+Alt+z', 'copy-filename-relative-path', function() copy_filename{ filename_format = 'relative_path' } end)
mp.add_key_binding('Ctrl+Z', 'copy-filename-absolute-path', function() copy_filename{ filename_format = 'absolute_path' } end)

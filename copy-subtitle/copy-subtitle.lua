-- copy-subtitle.lua - copy current subtitle to clipboard (a script for mpv player)
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
  console_message = true,
  console_message_print_copied = true,
  osd_message = true,
  osd_message_print_copied = false,
  osd_warning_nothing_to_copy = 'always',
  clipboard_command = 'xclip -rmlastnl -selection clipboard',
}

read_options(options, 'copy_subtitle')

local function copy_subtitle(prop)

  local result = mp.get_property(prop)

  if result ~= '' and result ~= nil then

    mp.commandv(
      'run', '/usr/bin/env', 'bash', '-c',
      string.format("<<<'%s' LANG=en_US.UTF-8 %s", result:gsub("'", "'\\''"), options.clipboard_command)
    )

    if options.console_message == true then
      if options.console_message_print_copied == true then
        print('`' ..  prop .. '` copied to clipboard:\n' .. result)
      else
        print('`' ..  prop .. '` copied to clipboard')
      end
    end

    if options.osd_message == true then
      if options.osd_message_print_copied == true then
        mp.osd_message('`' .. prop .. '` copied to clipboard:\n\n' .. result)
      else
        mp.osd_message('`' .. prop .. '` copied to clipboard')
      end
    end

  else

    if
      options.osd_warning_nothing_to_copy == 'always' or
      (options.osd_warning_nothing_to_copy == 'auto' and options.osd_message == true)
    then
      mp.osd_message('No `' .. prop  .. '` to copy')
    end

  end

end

mp.add_key_binding('Ctrl+c', 'copy-subtitle-primary', function() copy_subtitle('sub-text') end)
mp.add_key_binding('Ctrl+C', 'copy-subtitle-primary-ass', function() copy_subtitle('sub-text-ass') end)
mp.add_key_binding('Ctrl+Alt+c', 'copy-subtitle-secondary', function() copy_subtitle('secondary-sub-text') end)

-- osc-show-hide.lua - show or hide the on-screen controller (a script for mpv player)
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

-- Video tutorial: https://youtu.be/Pp3a5O5OI9U&t=1m06s

-- version: 0.1.0

require('mp.options')

local options = {
  hidden_mode = 'never', -- Accepted values are `'never'` or `'auto'`.
}

read_options(options, 'osc_show_hide')

local is_hidden = true

local function osc_show_hide()
  is_hidden = not is_hidden
  mp.commandv('script-message', 'osc-visibility', (is_hidden and options.hidden_mode or 'always'), 'no-osd')
end

mp.add_key_binding('/', 'osc-show-hide', osc_show_hide)

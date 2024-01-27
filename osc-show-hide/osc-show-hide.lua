-- osc-show-hide.lua - show or hide the on-screen controller (a script for mpv player)
-- copyright (c) 2024  Alex Rogers <https://github.com/linguisticmind> and contributors <https://github.com/linguisticmind/mpv-scripts/graphs/contributors>
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

-- version: 0.1.1

require('mp.options')
local utils = require('mp.utils')

local options = {
  hidden_mode = 'never', -- Accepted values are `'never'` or `'auto'`.
}

read_options(options, 'osc_show_hide')

local function osc_show_hide()
  local visibility = utils.shared_script_property_get('osc-visibility')
  mp.commandv('script-message', 'osc-visibility', ((visibility == 'auto' or visibility == 'never') and 'always' or options.hidden_mode), 'no-osd')
end

mp.add_key_binding('/', 'osc-show-hide', osc_show_hide)

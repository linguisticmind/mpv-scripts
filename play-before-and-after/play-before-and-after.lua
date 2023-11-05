-- play-before-and-after.lua - play an interval before or after the current position (a script for mpv player)
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
  interval_short = 3,
  interval_medium = 5,
  interval_long = 10,
}

read_options(options, 'play_before_and_after')

--

local function play_before(interval)
  local initial_position = mp.get_property_native('time-pos')
  mp.commandv('seek', -interval, 'relative+exact')
  if mp.get_property_native('pause') == true then mp.set_property_native('pause', false) end
  local function end_playback(name, value)
    if value >= initial_position then
      mp.commandv('set', 'pause', 'yes')
      mp.unobserve_property(end_playback)
    end
  end
  mp.observe_property('time-pos', 'native', end_playback)
end

local function play_after(interval)
  local initial_position = mp.get_property_native('time-pos')
  if mp.get_property_native('pause') == true then mp.set_property_native('pause', false) end
  local function end_playback(name, value)
    if value >= initial_position + interval then
      mp.commandv('set', 'pause', 'yes')
      mp.commandv('seek', -interval, 'relative+exact')
      mp.unobserve_property(end_playback)
    end
  end
  mp.observe_property('time-pos', 'native', end_playback)
end

mp.add_key_binding('Ctrl+,', 'play-before-short', function() play_before(options.interval_short) end)
mp.add_key_binding('Ctrl+.', 'play-after-short', function() play_after(options.interval_short) end)
mp.add_key_binding('<', 'play-before-medium', function() play_before(options.interval_medium) end)
mp.add_key_binding('>', 'play-after-medium', function() play_after(options.interval_medium) end)
mp.add_key_binding('Ctrl+<', 'play-before-long', function() play_before(options.interval_long) end)
mp.add_key_binding('Ctrl+>', 'play-after-long', function() play_after(options.interval_long) end)

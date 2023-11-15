-- ab-loop-seek-points.lua - seek to start and end points of an A/B loop (a script for mpv player)
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

-- Video tutorial: https://youtu.be/spf0cU3P3SI&t=9m40s

-- version: 0.1.0

local function seek_ab_loop_point(point)
  if point ~= 'a' and point ~= 'b' then return end
  if mp.get_property('ab-loop-' .. point) ~= 'no' then
    mp.commandv('seek', mp.get_property('ab-loop-' .. point), 'absolute+exact')
  else
    mp.osd_message('Loop point ' .. point:upper() .. ' is not set')
  end
end

mp.add_key_binding('Ctrl+;', 'ab-loop-seek-a', function() seek_ab_loop_point('a') end)
mp.add_key_binding("Ctrl+'", 'ab-loop-seek-b', function() seek_ab_loop_point('b') end)

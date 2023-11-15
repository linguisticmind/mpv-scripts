-- ab-loop-set-points.lua - set start and end points of an A/B loop (a script for mpv player)
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

-- Video tutorial: https://youtu.be/spf0cU3P3SI&t=1m53s

-- version: 0.1.0

require('mp.options')

local options = {
  toggle_seek_back = true,
  toggle_seek_forward = false,
  console_message = false,
}

read_options(options, 'ab_loop_set_points')

local function print_message(msg)
  if options.console_message == true then print(msg) end
  mp.osd_message(msg)
end

--

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

mp.add_key_binding(
  ':', 'ab-loop-set-a',
  function()
    local time_pos = mp.get_property_native('time-pos')
    mp.set_property_native('ab-loop-a', time_pos)
    print_message(
      'A/B loop start: ' ..
      timecode_from_seconds(time_pos) .. ' - ' ..
      timecode_from_seconds(mp.get_property_native('ab-loop-b'))
    )
  end
)

mp.add_key_binding(
  '"', 'ab-loop-set-b',
  function()
    local time_pos = mp.get_property_native('time-pos')
    mp.set_property_native('ab-loop-b', time_pos)
    print_message(
      'A/B loop end: ' ..
      timecode_from_seconds(mp.get_property_native('ab-loop-a')) .. ' - ' ..
      timecode_from_seconds(time_pos)
    )
  end
)

mp.add_key_binding(
  'Alt+L', 'ab-loop-set-sub',
  function()
    local sub_start = mp.get_property_native('sub-start')
    local sub_end = mp.get_property_native('sub-end')
    if sub_start and sub_end then
      mp.set_property_native('ab-loop-a', sub_start)
      mp.set_property_native('ab-loop-b', sub_end)
      print_message(
        'A/B loop: ' ..
        timecode_from_seconds(sub_start) .. ' - ' .. timecode_from_seconds(sub_end) .. ' (current subtitle)' 
      )
    else
      print_message(
        'Subtitle timecodes not available: ' ..
        tostring(sub_start) .. ' --> ' .. tostring(sub_end)
      )
    end
  end
)

mp.add_key_binding(
  'Alt+:', 'ab-loop-set-a-sub',
  function()
    local sub_start = mp.get_property_native('sub-start')
    if sub_start then
      mp.set_property_native('ab-loop-a', sub_start)
      print_message(
        'A/B loop start: ' ..
        timecode_from_seconds(sub_start) .. ' (current subtitle start)'
      )
    else
      print_message(
        'Subtitle timecodes not available: ' ..
        tostring(sub_start) .. ' --> ' .. tostring(sub_end)
      )
    end
  end
)

mp.add_key_binding(
  'Alt+"', 'ab-loop-set-b-sub',
  function()
    local sub_end = mp.get_property_native('sub-end')
    if sub_end then
      mp.set_property_native('ab-loop-b', sub_end)
      print_message(
        'A/B loop end: ' ..
        timecode_from_seconds(sub_end) .. ' (current subtitle end)'
      )
    else
      print_message(
        'Subtitle timecodes not available: ' ..
        tostring(sub_start) .. ' --> ' .. tostring(sub_end)
      )
    end
  end
)

mp.add_key_binding(
  '|', 'ab-loop-show',
  function()
    print_message(
      'A/B loop: ' ..
      timecode_from_seconds(mp.get_property_native('ab-loop-a')) .. ' - ' ..
      timecode_from_seconds(mp.get_property_native('ab-loop-b'))
    )
  end
)

mp.add_key_binding(
  'Alt+|', 'ab-loop-clear',
  function()
    mp.set_property_native('ab-loop-a', 'no')
    mp.set_property_native('ab-loop-b', 'no')
    print_message('Clear A/B loop')
  end
)

mp.add_key_binding(
  'L', 'ab-loop-toggle',
  function() 
    local ab_loop_count = mp.get_property_native('ab-loop-count')
    local ab_loop_a = mp.get_property_native('ab-loop-a')
    local ab_loop_b = mp.get_property_native('ab-loop-b')
    local time_pos = mp.get_property_native('time-pos')
    local loop_points_status
    if ab_loop_a == 'no' and ab_loop_b == 'no' then
      loop_points_status = 'not set'
    elseif ab_loop_a == 'no' then
      loop_points_status = 'A not set'
    elseif ab_loop_b == 'no' then
      loop_points_status = 'B not set'
    else
      loop_points_status = 'set'
    end
    if ab_loop_count == 0 then
      mp.command('no-osd set ab-loop-count inf')
      if loop_points_status == 'set' then 
        print_message('A/B loop on')
      else
        print_message('A/B loop on (' .. loop_points_status .. ')')
      end
    else
      mp.command('no-osd set ab-loop-count 0')
      print_message('A/B loop off')
    end
    if ab_loop_a ~= 'no' and ab_loop_b ~= 'no' then
      if options.toggle_seek_back == true and (time_pos > ab_loop_b) then
        mp.commandv('seek', ab_loop_a, 'absolute')
      elseif options.toggle_seek_forward == true and (time_pos < ab_loop_a) then
        mp.commandv('seek', ab_loop_a, 'absolute')
      end
    end
  end
)

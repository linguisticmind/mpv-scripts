-- clock.lua - show clock on the screen (a script for mpv player)
--
-- copyright (c) 2015-2018  mozbugbox@yahoo.com.au <https://gitlab.com/mozbugbox>
-- copyright (c) 2023  Alex Rogers <https://github.com/linguisticmind>
--
-- The following code is a derivative work of the code from mozbugbox
-- <https://gitlab.com/mozbugbox/mpv-script-mozbugbox/-/blob/6c2e7f0ac2faa19563bf6f9d08d182371180758c/clock.lua>, 
-- which is licensed under GNU GPL v3.  This code therefore is also
-- licensed under the terms of the GNU General Public License v3.
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

-- Video tutorial: https://youtu.be/Pp3a5O5OI9U&t=3m36s

-- version: 0.1.0

local assdraw = require('mp.assdraw')

require('mp.options')

local options = {
  font = 'VCR OSD Mono', -- The _VCR OSD Mono_ font can be downloaded here: https://www.dafont.com/vcr-osd-mono.font
  font_size = 50,
  clock_position_x = -327, -- Negative values indicate offset from the right.
  clock_position_y = 100, -- Negative values indicate offset from the bottom.
  datetime_format = '%H:%M:%S', -- For a list of special character sequences, see https://www.lua.org/pil/22.1.html, or run `man strftime` in your terminal.
  update_timeout = 1,
  show_on_start = false,
}

read_options(options, 'clock')

local periodic_timer

local function clock_show_hide()

  if periodic_timer then

    periodic_timer:kill()
    periodic_timer = nil
    local w, h = mp.get_osd_size()
    mp.set_osd_ass(w, h, '')

  else

    local function show_clock()
      local w, h = mp.get_osd_size()
      local time = os.date(options.datetime_format)
      local ass = assdraw:ass_new()
      ass:new_event()
      ass:pos((options.clock_position_x >= 0 and options.clock_position_x or options.clock_position_x + tonumber(w)), (options.clock_position_y >= 0 and options.clock_position_y or options.clock_position_y + tonumber(h)))
      ass:an(1)
      ass:append(string.format('{\\fn%s\\fs%d}', options.font, options.font_size))
      ass:append(time)
      ass:an(0)
      mp.set_osd_ass(w, h, ass.text)
    end

    show_clock()
    periodic_timer = mp.add_periodic_timer(options.update_timeout, show_clock)

  end

end

if options.show_on_start == true then clock_show_hide() end

mp.add_key_binding('?', 'clock-show-hide', clock_show_hide)

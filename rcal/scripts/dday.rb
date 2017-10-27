#!/usr/bin/ruby -w
# encoding: utf-8

require 'calendar'

year = ARGV[0] ||= Time.now.strftime("%Y").to_i

# 4/4, 6/6, 8/8, 10/10, 12/12 allways fall on the same day. That day
# is the so-called "Doomsday."
c = Calendar.new(4, 4, year)
a = c.get_day_of_week_name
puts "#{year}'s Doomsday is #{a}"

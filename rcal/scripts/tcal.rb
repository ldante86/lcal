#!/usr/bin/ruby -w
# encoding: utf-8

# Show tomorrow's calendar.

require 'calendar'

month = Calendar::MONTH.to_i
day = Calendar::DAY.to_i
year = Calendar::YEAR.to_i

c = Calendar.new(month, day, year)

if month == 12 && day == 31
  c.m = c.d = 1
  c.y += 1
elsif day == c.get_month_len.to_i
  c.m += 1
  c.d = 1
else
  c.d += 1
end

c.print_g_monthly

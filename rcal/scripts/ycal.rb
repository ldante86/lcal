#!/usr/bin/ruby -w
# encoding: utf-8

# Show yesderday's calendar.

require 'calendar'

month = Calendar::MONTH.to_i
day = Calendar::DAY.to_i
year = Calendar::YEAR.to_i

c = Calendar.new(month, day, year)

if month == 1 && day == 1
  c.m = 12
  c.y -= 1
  c.d = 31
elsif day == 1
  c.m -= 1
  c.d = c.get_month_len.to_i
else
  c.d -= 1
end

c.print_g_monthly

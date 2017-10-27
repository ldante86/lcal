#!/usr/bin/ruby -w
# encoding: utf-8

require 'calendar'

y = ARGV[0] ||= Calendar::YEAR

c = Calendar.new(1, nil, y)

(1..12).each do |mon|
  c.m = mon
  c.print_weeknums
end

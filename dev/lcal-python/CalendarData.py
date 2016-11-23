#!/usr/bin/env python3.4

import time
import sys

class CalendarData:

	monthNames = [0,"January","February","March","April","May","June","July",
		      "August","September","October","November","December"]
	dayNames = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

	def __init__(self,m,d,y):
		self.m = m
		self.d = d
		self.y = y

	def monthLen(self):
		if (self.y % 4 == 0) and (self.y % 100 != 0) or (self.y % 400 == 0):
			return ["",31,29,31,30,31,30,31,31,30,31,30,31]
		else:
			return ["",31,28,31,30,31,30,31,31,30,31,30,31]

	def dayOfWeek(self):
		mcodes = ["",6,2,2,5,0,3,5,1,4,6,2,4]
		w = ( ((self.y // 4) - (self.y // 100)) + (self.y // 400) + self.d + self.y + mcodes[self.m] )

		mon = self.monthLen()
		if (mon[2] == 29) and ( self.m < 3):
			w-=1

		return (w % 7)

def main():

	if (len(sys.argv) == 4):
		month = int(sys.argv[1])
		day = int(sys.argv[2])
		year = int(sys.argv[3])
	else:
		month = int(time.strftime("%m"))
		day = int(time.strftime("%d"))
		year = int(time.strftime("%Y"))

	cal = CalendarData(month,day,year)

	a = cal.dayOfWeek()

	print(cal.dayNames[a])

if __name__ == "__main__":
	main()

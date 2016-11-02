## lcal - display a calendar

### DESCRIPTION
**lcal** is a command-line calendar similar to cal/ncal. This program produces Gregorian
and Julian calendars, an HTML 5 calendar, an ncal formatted calendar, Discordian dates, dates
of Easter (Western, Orthodox, Orthodox-Julian), monthly and yearly calendars, and Julian Day Number conversions.

### USAGE
**lcal** [option] [month] [day] [year]

### OPTIONS
* **-d  --day-of-week**
	* return day of week for date
* **-e  --easter**
	* show the date for Easter (Western)
* **-h  --no-highlighting**
	* disable highlighting
* **-j  --julian**
	* show Julian calendar
* **-m  --month**
	* show calendar for month (and year)
* **-n  --next**
	* show next month's calendar
* **-o  --orthodox**
	* show the date for Easter (Orthodox)
* **-p  --previous**
	* show last month's calendar
* **-y  --year**
	* show yearly calendar
* **-x  --date-diff**
	* show time between two dates. This option takes either 3 parameters or 6, as in **MM DD YYYY MM DD YYYY** or **MM DD YYYY**.
	  If three, the current date is computed against it; if six, one date is computed against the other.
* **-D  --discordian**
	* show Discordian date
* **-G  --gregorian-to-jdn**
	* convert Gregorian date to Julian day number
* **-H  --html**
	* generate an html calendar for date
* **-J  --jdn-to-gregorian**
	* convert Julian day number to Gregorian date
* **-N  --ncal**
	* show calendar in ncal mode
* **-O  --orthodox-julian**
	* show the date for Orthodox Easter as Julian date
* **-V  --version**
	* show version information and exit
* **-1  --one**
	* show only the current month. Default
* **-3  --three**
	* show last, current and next month
*     **--help**
	* show this usage and exit

### PARAMETERS
Most flags can take a date string as an argument. A single parameter is either a **month** -- this
will print the month for the current year -- or it is a **year** -- this will print the yearly calendar
for the specified year. Two parameters are **month** and **year** -- this will print the month for the
specified year. Three parameters are **month**, **day** and **year** -- this will print the specified
calendar with the day highlighted.

**month** can be numbers [1-12], or three or more letters of the month name: jan, feb, mar, etc.

The year range is currently **1753 - 9999**.

The **-m** flag is the same as **month** without the flag. A **year** can be added after **month**.

To disable highlighting for **--html**, use **-h** before this flag.

Flags **-1**, **-n** and **-p** stop reading any arguments after them.

### VERSION
0.0.1

### LICENSE
**(c) 2014-2016 Luciano D. Cecere - ldante86@aol.com**

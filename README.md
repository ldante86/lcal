## lcal - display a calendar

### DESCRIPTION
**lcal** is a command-line calendar similar to cal/ncal. This program produces Gregorian and Julian calendars, an HTML 5 calendar, an ncal formatted calendar, weeknumbers, Discordian dates, dates of Easter (Western, Orthodox, Orthodox-Julian), monthly and yearly calendars, and Julian Day Number conversions.

### USAGE
**lcal** [option] [month] [day] [year]

### OPTIONS
* **-d  --day-of-week**
	* return day of week for date
* **-e  --easter**
	* show the date for Easter (Western)
* **-h  --no-highlight**
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
* **-w  --week-number**
	* Show week number.
* **-x  --date-diff**
	* show time between two dates. This option takes either 3 parameters or 6, as in **MM DD YYYY MM DD YYYY** or **MM DD YYYY**. If three, the current date is computed against it; if six, one date is computed against the other.
* **-y  --year**
	* show yearly calendar
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
* **-W  --show-week-number**
	* show week numbers next to calendar
* **-1  --one**
	* show only the current month. Default
* **-3  --three**
	* show last, current and next month
*     **--help**
	* show this usage and exit

### PARAMETERS
Most flags can take a date string as an argument. A single parameter is either a **month** -- this will print the month for the current year -- or it is a **year** -- this will print the yearly calendar for the specified year. Two parameters are **month** and **year** -- this will print the month for the specified year. Three parameters are **month**, **day** and **year** -- this will print the specified calendar with the day highlighted.

**month** can be numbers [**1-12**], or three or more letters of the month name: **jan**, **feb**, **mar**, etc.

The **-m** flag is the same as **month** without the flag. A **year** can be added after **month**.

To disable highlighting for **--html**, use **-h** before this flag.

Flags **-1**, **-n** and **-p** stop reading arguments after them.

### TAB COMPLETION

Source **/scripts/lcal_completion** for **lcal** to support tab completion. The typical location for completion scripts is **/etc/bash_completion.d/**.

For current shell:

````bash
cd lcal/scripts
source lcal_completion
````
Make permanent:

````bash
cd lcal/scripts
sudo ln -fs "${PWD}"/lcal_completion /etc/bash_completion.d/lcal_completion
````

Once sourced, **lcal** can generate a list of short and long flags.

For example:

````bash
% lcal - [TAB][TAB]
-1  -3  -d  -D  -e  -G  -h  -H  -j  -J  -m  -n  -N  -o  -O  -p  -V  -w  -W  -x  -y
````

````bash
% lcal -- [TAB][TAB]
--date-diff          --easter             --html               --month              --no-highlight       --orthodox-julian    --three              --year
--day-of-week        --gregorian-to-jdn   --jdn-to-gregorian   --ncal               --one                --previous           --version
--discordian         --help               --julian             --next               --orthodox           --show-week-numbers  --week-number
````

### BUGS

So far, **lcal** does not account for the Gregorian Reformation. so the year range is currently **1753 - 9999**. The algorithm I used for calculating the day of week does not use Julian Day Numbers -- which it should.

### VERSION
0.0.1

### SEE ALSO
cal(1), ncal, gcal, ccal, when

### LICENSE
**(c) 2014-2016 Luciano D. Cecere - ldante86@aol.com**

# lcal - display a calendar

[![](https://codeclimate.com/github/ldante86/lcal/badges/gpa.svg)](https://codeclimate.com/github/ldante86/lcal) [![](https://codeclimate.com/github/ldante86/lcal/badges/issue_count.svg)](https://codeclimate.com/github/ldante86/lcal)

## DESCRIPTION

**lcal** is a command-line calendar similar to cal/ncal, but written in bash. This program produces Gregorian and Julian calendars, an HTML 5 calendar, an ncal formatted calendar, weeknumbers, Discordian dates, dates of Easter (Western, Orthodox, Orthodox-Julian), monthly and yearly calendars, and Julian Day Number conversions.

## USAGE

**lcal** [option] [month] [day] [year]

## OPTIONS

- **-d --day-of-week**

  - return day of week for date

- **-e --easter**

  - show the date for Easter (Western)

- **-h --no-highlight**

  - disable highlighting

- **-j --julian**

  - show Julian calendar

- **-m --month**

  - show calendar for month (and year)

- **-n --next**

  - show next month's calendar

- **-o --orthodox**

  - show the date for Easter (Orthodox)

- **-p --previous**

  - show last month's calendar

- **-w --week-number**

  - Show week number.

- **-x --date-diff**

  - show time between two dates. This option takes either 3 parameters or 6, as in **MM DD YYYY MM DD YYYY** or **MM DD YYYY**. If three, the current date is computed against it; if six, one date is computed against the other.

- **-y --year**

  - show yearly calendar

- **-D --discordian**

  - show Discordian date

- **-G --gregorian-to-jdn**

  - convert Gregorian date to Julian day number

- **-H --html**

  - generate an html calendar for date

- **-J --jdn-to-gregorian**

  - convert Julian day number to Gregorian date

- **-N --ncal**

  - show calendar in ncal mode

- **-O --orthodox-julian**

  - show the date for Orthodox Easter as Julian date

- **-V --version**

  - show version information and exit

- **-W --show-week-number**

  - show week numbers next to calendar

- **-1 --one**

  - show only the current month. Default

- **-3 --three**

  - show last, current and next month

- **--help**

  - show this usage and exit

## PARAMETERS

Most flags can take a date string as an argument. A single parameter is either a **month** -- this will print the month for the current year -- or it is a **year** -- this will print the yearly calendar for the specified year. Two parameters are **month** and **year** -- this will print the month for the specified year. Three parameters are **month**, **day** and **year** -- this will print the specified calendar with the day highlighted.

**month** can be numbers [**1-12**], or three or more letters of the month name: **jan**, **feb**, **mar**, etc.

The **-m** flag is the same as **month** without the flag. A **year** can be added after **month**.

To disable highlighting for **--html**, use **-h** before this flag.

Flags **-1**, **-n** and **-p** stop reading arguments after them.

## TAB COMPLETION

Source **/scripts/lcal_completion** for **lcal** to support tab completion. The typical location for completion scripts is **/etc/bash_completion.d/**.

For current shell:

```bash
cd lcal/scripts
source lcal_completion
```

Make permanent:

```bash
cd lcal/scripts
sudo ln -fs "${PWD}"/lcal_completion /etc/bash_completion.d/lcal_completion
```

Once sourced, **lcal** can generate a list of short and long flags.

For example:

```bash
% lcal - [TAB][TAB]
-1  -3  -d  -D  -e  -G  -h  -H  -j  -J  -m  -n  -N  -o  -O  -p  -V  -w  -W  -x  -y
```

```bash
% lcal -- [TAB][TAB]
--date-diff          --easter             --html               --month              --no-highlight       --orthodox-julian    --three              --year
--day-of-week        --gregorian-to-jdn   --jdn-to-gregorian   --ncal               --one                --previous           --version
--discordian         --help               --julian             --next               --orthodox           --show-week-numbers  --week-number
```

## OTHER FILES

- **pc** - a perpetual calendar generator.

  Using strings of the 14 possible calendars (7 common years, 7 leap years) and basic functions taken from **lcal** itself, **pc** can generate any monthly calendar. It is fast and lightweight, and unlike **lcal**, **pc** is compatible with the Korn Shell.

  Development scripts for **pc** can be found in _dev/perpetual-scripts_

- **cal** - a perpetual calendar generator.

  This is like **pc** above, but it is used to only print the current calendar and does not accept any flags other than the *-h* flag for unbolding. **cal** is designed to be the smallest program of the lot.

- **dcal** - print the Discordian calendar.

  This script prints a formatted calendar based on the Discordian seasons. See the [README](https://github.com/ldante86/lcal/blob/master/dev/discordian/README.md) for **dcal** for more information.

- **plcal** - a calendar written in perl.

  This calendar is the start of what might some day become the "finished product." Still in development, yet functional as it is now, **plcal** will discard all of the trappings and disadvantages of bash and be fully portable between operating systems.

- dev/**shcal** - a POSIX compliant calendar.

  This program is slowly coming together, but when it is finished it will be sh-dash-ash-zsh-bash-ksh compliant.

## BUGS

So far, **lcal** does not account for the Gregorian Reformation. so the year range is currently **1753 - 9999**. The algorithm I used for calculating the day of week does not use Julian Day Numbers -- which it should.

See: [BUGS](https://github.com/ldante86/lcal/blob/master/BUGS.md)

## VERSION

1.0.0

## SEE ALSO

cal, ddate, ncal, gcal, ccal, when

## LICENSE

**(c) 2014-2017 Luciano D. Cecere - ldante86@aol.com**

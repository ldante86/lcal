
# Function documentation manual for lcal


Function: **_main**

Parameters: **_main** *flags parameters*

	 This function is the starting point of lcal. It processes

	 all values and flags passed on the command-line and forwards them

	 to the appropriate function calls.

Function: **_is_year_valid**

Parameters: **_is_year_valid** *year*

	 return 1 if year is not in range.

Function: **_is_month_valid**

Parameters: **_is_month_valid** *month*

	 return 1 if month is not in range.

Function: **_is_day_valid**

Parameters: **_is_day_valid** *month day year*

	 return 1 if day is not in range of month

	 in the specified year.

Function: **_is_date_valid**

Parameters: **_is_date_valid** *month day year*

	 This function should be called before any other.

	 It checks if months, days or years are within valid limits -

	 i.e. 13 1 2000, etc. Return 1 if date is invalid. If no

	 date is passed to this function, skip it; the default date

	 is used.

Function: **_parse_month**

Parameters: **_parse_month** *month*

	 return month number [1-12] if month was

	 typed as a name. Stop reading after third character.

	 Return 255 if not found.

Function: **_month_len**

Parameters: **_month_len** *month year*

	 Print the length of the month. Calls

	 _isleap in the case of February.

Function: **_is_leap**

Parameters: **_is_leap** *year*

	 Loads the LEAP variable if year is a leap year.

Function: **_day_of_week**

Parameters: **_day_of_week** *month day year*

	 Print the day number for date. 0 = Sunday, etc.

Function: **_gregorian_array**

Parameters: **_gregorian_array** *month year*

	 Loads the CALENDAR_DATA array with correctly

	 spaced numbers for later printing.

Function: **_print_gregorian_monthly**

Parameters: **_print_gregorian_monthly** *month day year*

	 Print the Gregorian calendar for date.

	 To prevent highlighting, set the day value to 0.

Function: **_julian_array**

Parameters: **_julian_array** *month day year*

	 Loads the CALENDAR_DATA array with correctly

	 spaced numbers for later printing.

Function: **_print_julian_monthly**

Parameters: **_print_julian_monthly** *month day year*

	 Print the Julian calendar for date.

	 To prevent highlighting, set the day value to 0.

Function: **_center**

Parameters: **_center** *length "string"*

	 Center a line of text in a specified width.

	 The string must be quoted.

Function: **_ncenter**

Parameters: **_ncenter** *length "string"*

	 Center a line of text in a specified width.

	 No new line is added at the end. The string must be quoted.

Function: **_shift_month_forward**

Parameters: **_shift_month_forward** *month year*

	 Moves the month number up by one, or back to one

	 if the current month is December.

Function: **_shift_month_backward**

Parameters: **_shift_month_backward** *month year*

	 Moves the month number back by one, or up to twelve

	 if the current month is January.

Function: **_day_in_year**

Parameters: **_day_in_year** *day month year*

	 Get the one-based number for date. Day 1 starts

	 on January 1, day 365 is December 31.

Function: **_jdn_to_gregorian_date**

Parameters: **_jdn_to_gregorian_date** *jdn*

	 Convert a Julian day number into month, day and

	 year in Gregorian notation. gday, gmonth, gyear are loaded.

Function: **_gregorian_date_to_jdn**

Parameters: **_gregorian_date_to_jdn** *month day year*

	 Convert Gregorian month, day and year into the

	 Julian day number.

Function: **_print_ncal_gregorian**

Parameters: **_print_ncal_gregorian** *month day year*

	 Print the Gregorian calendar for date in ncal

	 format. To prevent highlighting, set the day value to 0.

Function: **_ncal_array**

Parameters: **_ncal_array** *month day year*

	 Loads the NCAL array with correctly

	 spaced numbers for printing the Julian calendar

	 in the ncal format.

Function: **_print_ncal_julian**

Parameters: **_print_ncal_julian** *month day year*

	 Print the Julian calendar for date in ncal

	 format. To prevent highlighting, set the day value to 0.

Function: **_show_week_numbers**

Parameters: **_show_week_numbers** *month day year*

	 print week numbers next to the Gregorian calendar.

Function: **_ordinal**

Parameters: **_ordinal** *number*

	 Print the ordinal of a number: 1st, 2nd, 3rd, etc.

Function: **_show_discordian_date**

Parameters: **_show_discordian_date** *month day year*

	 Print a date according to the Discordian calendar.

	 Feb 29th of a leap year is St. Tibbs day, which is a day

	 that doesn't exist!

Function: **_print_gregorian_yearly**

Parameters: **_print_gregorian_yearly** *year*

	 Print the formatted yearly calendar for year.

Function: **_print_gregorian_three_months**

Parameters: **_print_gregorian_three_months** **

	 Print last, current and next month on one row.

Function: **_week_number**

Parameters: **_week_number** *month day year*

	 Return week-number of date. If the week-number

	 is 0, return the last week-number of last year.

Function: **_western_pfm_date**

Parameters: **_western_pfm_date** *year*

	 Find the day number and month of the Paschal Full Moon.

Function: **_orthodox_pfm_date_2**

Parameters: **_orthodox_pfm_date_2** *year*

	 Find the day number and month of the Paschal Full Moon.

	 This is the second chart.

Function: **_western_first_2**

Parameters: **_western_first_2** *year*

	 Use the first two digits of year to

	 find the cooresponding number on the chart.

Function: **_orthodox_western_last_2**

Parameters: **_orthodox_western_last_2** *year*

	 Use the last two digits of year to

	 find the cooresponding number on the chart.

Function: **_show_western_easter**

Parameters: **_show_western_easter** *year*

	 Find the date of Easter according to the Gregorian calendar.

Function: **_orthodox_first_2**

Parameters: **_orthodox_first_2** *year*

	 Use the first two digits of year to

	 find the cooresponding number on the chart.

Function: **_orthodox_pfm_date**

Parameters: **_orthodox_pfm_date** *year*

	 Find the day number and month of the Paschal Full Moon.

Function: **_orthodox_pfm_date_2**

Parameters: **_orthodox_pfm_date_2** *year*

	 Find the day number and month of the Paschal Full Moon.

	 This is the second chart.

Function: **_convert_to_gregorian**

Parameters: **_convert_to_gregorian** *year*

	 convert a Julian year to a Gregorian year.

	 This corrects the Julian "drift."

Function: **_show_orthodox_easter**

Parameters: **_show_orthodox_easter** *year*

	 Find the date of Easter according to the Eastern Orthodox calendar.

	 if REQUEST_JULIAN is set, the date is converted to the Julian date.

Function: **_show_html_calendar**

Parameters: **_show_html_calendar** *month day year*

	 Generate raw html of the specified calendar. A CSS

	 script is loaded into the css variable. Styling should be

	 changed from there.

Function: **_date_diff**

Parameters: **_date_diff** *month day year month day year*

	 Show the time difference between two dates.

	 3 parameters: compute today's date against specified date.

	 6 parameters: computer one date against the other.

Function: **_exit**

Parameters: **_exit** *exit-status*

	 Clean up the terminal and exit according

	 to an exit status. If invalid flags or parameters

	 were passed, use `_exit 1`, otherwise use `_exit 0`.

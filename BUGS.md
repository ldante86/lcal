# Bugs

- To maintain a (usually) fast execution, the yearly calendar and the three-month-spread (--three flag) don't support bolding.

- The algorithm used for determining the day of week is limiting. I still have the Gregorian Reformation to get around. The first missing day, according to the US country code, is September 3rd 1752 and ends on the 14th. The days in between are all considered Thursday. Dates before this period need to be adjusted 11 days.

  Here's the mangled September 1752 calendar created by the "_Calendar Act_" of 1751:

```
   September 1752     
Su Mo Tu We Th Fr Sa  
       1  2 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30
```

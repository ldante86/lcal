README for plcal-0.0.1

### PROGRAM

**plcal**

### DESCRIPTION

**plcal** is a simple command-line calendar written in perl.

### USAGE

**plcal** [option] [--date=**mm yyyy**]

### OPTIONS

| Option | Description     |
| :------------- | :------------- |
| -b   | Use bracketed bolding (<>)  |
| -h   | Disable highlighting   |
| -n   | Show next month  |
| -p   | Show previous month
| --date=**mm yyyy**       | Display a calendar for a specified month and year       |
| --help  | Show hexp text and exit  |
| --month=**mm**           | Show specified month  |

### EXAMPLE

Command:

```
plcal --date=10 1986
```

Output:
```
    October 1986
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31    

```

### NOTES

The **-b** option will be the default if the OS is Windows.

### AUTHOR

The program **plcal** and this documentation was written by Luciano D. Cecere <ldante1986@gmail.com>.

### LICENSE

**plcal** is free software; you can redistribute it and/or modify it under the terms of the GPL, or, optionally, Perl's license.

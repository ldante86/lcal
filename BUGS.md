## Bugs in lcal

### FIXED
* If the year is non-leap and the month has 30 days in it and the 30th day is a Sunday,
  a week number will be missing for that month. There may be other instances.
	* `lcal -W 9 2012`
	* `lcal -W 9 2018`


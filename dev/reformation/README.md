## README for reformation

These development files are an attempt to integrate the Gregorian Reformation into **lcal**. Changes include a new day of week algorithm, a pre 1753 leap year function and a few helper functions for counting centuries and leap years. These additions have an overall impact on the program. month_array replaces month_len and month lengths are requested by len[m]. month_array should only be called once per program execution. 

The only drawback I can see so far is that **lcal** is much slower with these additions. *lcal.dev* will stay here until I can improve on its poor performance.

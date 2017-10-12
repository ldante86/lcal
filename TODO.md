# TODO for lcal

- I need a small parser function to catch illegal flag combinations. Right now flags are processed by precedence on the command-line. The main function has sort of a parser, but it does not cover everything.

  Combinations like this should not be legal:

  ```
  % lcal --one --three --html
  ```

- Work on **[dcal](https://github.com/ldante86/lcal/tree/master/dev/discordian)**.

- _day_of_week needs to be using Julian Day Numbers so lcal can compute past the Gregorian Reformation - years 0-9999.

- Add support for different locales. Start week on Monday, etc. `locale -c LC_TIME`
- Provide capability to load CSS files - --css file.css, etc
- Finish Hebrew calendar code and incorporate it into lcal. --hebrew, etc.
- Add holiday list.
- Add appointments and special dates. Boldable, requires a more sophisticaed print function.
- Make a config file, locales, appointments, etc.
- Add ASCII colors.
- Make ldoc print function comments.
- ~~Make a perpetual calendar with arrays.~~ DONE

# Any contributions or rough-drafts are welcome!

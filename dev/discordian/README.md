## README for discordia

### **dcal** - print the Discordian calendar

**dcal** represents each of the five seasons of the Discordian year. There are 73 days within each season. Every year is 365 days long and every four years there is a non-existent day called St. Tibs; this day occurs between days 59 and 60 in the month of Chaos -- February 29 to the rest of us. The five seasons are: *Chaos*, *Discord*, *Confusion*, *Bureaucracy*, and *The Aftermath*. There are five days in a Discordian week: *Sweetmorn*, *Boomtime*, *Pungenday*, *Prickle-Prickle*, and *Setting Orange*. Aside from St. Tibs day, there are 5 season holydays that occur on the 5th day of each season: *Chaoflux*, *Discoflux*, *Confuflux*, *Bureflux*, and *Afflux* --  and 5 Apostle holydays that occur on the 50th day of each season: *Mungday*, *Mojoday*, *Syaday*, *Zaraday*, and *Maladay*. These days are represented with an asterisk. St. Tibs day will not be shown! The Discordian year is 1166 added to the civil year: 2016 + 1166 = 3182.

**dcal** prints the season in which the Gregorian *date* falls. A season spans multiple months -- the season of Chaos starts on January 1st and ends on March 14th, etc.

Discordian dates are handled by **lcal**

    % lcal --discordian 2 28 2016
    Today is Prickle-Prickle, the 59th day of Chaos in the YOLD 3182

    % lcal --discordian 2 29 2016
    St. Tib's Day, 3182 YOLD

    % lcal --discordian 3 1 2016
    Today is Setting Orange, the 60th day of Chaos in the YOLD 3182

### See also

  [Discordian calendar](https://en.wikipedia.org/wiki/Discordian_calendar)

  [ddate](http://linuxcommand.org/man_pages/ddate1.html)

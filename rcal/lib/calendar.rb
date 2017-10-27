class Calendar

  MONTH = Time.now.strftime("%m")
  DAY = Time.now.strftime("%d")
  YEAR  = Time.now.strftime("%Y")

  WEEKDAYS = [
	"Sunday", # 0
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday" # 6
	].freeze

  MONTH_NAMES = [
	"UNUSED",
	"January", # 1
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December" # 12
	].freeze

  WEEK = {
	"g" => "Su Mo Tu We Th Fr Sa",
	"j" => "Sun Mon Tue Wed Thu Fri Sat"
	}

  SEPT_1752 = [
	"   ", "   ", 1, 2, 14, 15, 16, 17, 18, 19,
	20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
	].freeze

  HELP = "try: `rcal --help' for usage information"

  def initialize(m, d, y)
    @m, @d, @y = m.to_i, d.to_i, y.to_i

    if(@m > 12) || (@m < 1)
      puts("month out of range [1..12]")
      puts(HELP)
      exit 1
    end
    if(@d > get_month_len)
      printf("%s does not have %d days in it for the year %d\n",
        MONTH_NAMES[@m], @d, @y)
      puts(HELP)
      exit 1
    end
    if(@y < 1753) || (@y > 9999)
      puts("year out of range [1753..9999]")
      puts(HELP)
      exit 1
    end
  end

  attr_accessor :m
  attr_accessor :d
  attr_accessor :y

  def get_array
    @cal
  end

  def get_day_of_week_number
    day_of_week(@m, @d, @y)
  end
  
  def get_day_of_week_name
    WEEKDAYS[day_of_week(@m, @d, @y)]
  end

  def get_diy
    day_in_year(@m, @d, @y)
  end

  def get_first_day_num
    day_of_week(@m, 1, @y)
  end

  def get_jdn
    gregorian_date_to_julian_date(@m, @d, @y)
  end

  def get_leap
    is_leap(@y) == 29 ? 1 : 0
  end

  def get_month_len
    month_len(@m, @y)
  end

  def get_month_name
    MONTH_NAMES[@m]
  end

  def get_week_num
    week_num(@m, @d, @y)
  end

  def get_western_easter
    western_easter(@y)
  end

  def get_year
    @y
  end

  def center(wd, str)
    printf("%*s\n", ((wd + str.length) / 2), str)
  end

  def day_in_year(m, d, y)
    for i in 1..m - 1 do
      d += month_len(i, y)
    end
    d
  end

  def is_leap(y)
    if(y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) then
      29
    else
      28
    end
  end

  def month_len(m, y)
    case(m)
      when 4, 6, 9, 11            then 30
      when 1, 3, 5, 7, 8, 10, 12  then 31
      when 2                      then is_leap(y)
    end
  end

  def day_of_week(m, d, y)
    initialize(@m, @d, @y)
    m, d, y = m.to_i, d.to_i, y.to_i

    century = y / 100
    mcodes = %w( "UNUSED" 6 2 2 5 0 3 5 1 4 6 2 4 )
    mm = mcodes[m].to_i

    weekmonth = ((y / 4) - century) + (y / 400) + d + y + mm
    weekmonth -= 1 if(is_leap(y) == 29) && (m < 3)

    weekmonth % 7
  end

  def load_g_array
    initialize(@m, @d, @y)

    @first = get_first_day_num
    len = get_month_len

    @cal = []
    for i in 1..@first 
      @cal << "   "
    end if(@first >= 1)

    for i in 1..42 - @first
      u = i.to_s
      if(i < 10) then
        @cal << " #{u} "
      elsif(i > len)
        @cal << "   "
      else
        @cal << "#{u} "
      end
    end
  end

  def print_g_monthly
    load_g_array

    center(21, "#{MONTH_NAMES[@m]} #{@y}")
    puts WEEK["g"]

    @cal.length.times do |i|
      puts if(i % 7 == 0) && (i != 0)
      if(i - (@first - 1) == @d) && (i - (@first - 1) < 10) && (@d > 0) then
        printf("\e[7m %d\e[27m ", @d)
      elsif(i - (@first - 1) == @d) && (i - (@first - 1) > 9) && (@d > 0) then
        printf("\e[7m%d\e[27m ", @d)
      else
        print(@cal[i])
      end
    end
    puts
  end

  def load_j_array
    initialize(@m, @d, @y)

    @first = get_first_day_num
    len = get_month_len
    dnum = get_diy - (@d - 1)

    @cal = []
    for i in 1..@first
      @cal << "    "
    end if(@first >= 1)

    x = 0
    for i in dnum..dnum + 42 - @first - 1
      x += 1
      u = i.to_s
      if(i < 10) then
        @cal << "  #{u} "
      elsif(x > len) then
        @cal << "    "
      elsif(i < 100) && (i > 9) then
        @cal << " #{u} "
      else
        @cal << "#{u} "
      end
    end
  end

  def print_j_monthly
    load_j_array

    jd = get_diy

    center(27, "#{MONTH_NAMES[@m]} #{@y}")
    puts WEEK["j"]

    @cal.length.times do |i|
      puts if(i % 7 == 0) && (i != 0)
      if(i - (@first - 1) == @d) && (jd < 10) && (@d > 0) then
        printf("\e[7m  %d\e[27m ", jd)
      elsif(i - (@first - 1) == @d) && (jd > 9) && (jd < 100) && (@d > 0) then
        printf("\e[7m %d\e[27m ", jd)
      elsif(i - (@first - 1) == @d) && (jd > 99) && (@d > 0) then
        printf("\e[7m%d\e[27m ", jd)
      else
        print(@cal[i])
      end
    end
    puts
  end

  def week_num(m, d, y)
    initialize(@m, @d, @y)
    weekday = day_of_week(m, d, y)
    diy = day_in_year(m, d, y)
    weekday = 7 if(weekday == 0)

    if(month_len(2, y) == 29) && (m > 2) then
      if(weekday == 7) then
        weeknum = ((((diy + 1) - weekday) + 10)) / 7 #- 1
      else
        weeknum = ((((diy + 1) - weekday) + 10)) / 7 - 1
      end
    else
      if(weekday == 7) then
        weeknum = ((((diy - weekday) + 10)) / 7 + 1)
      else
        weeknum = ((((diy - weekday) + 10)) / 7)
      end
    end

    weeknum
  end

  def print_weeknums
    initialize(@m, @d, @y)

    wn = []
    (1..27).step(7) do |w|
      wn << week_num(@m, w, @y)
    end

    wn[0] = week_num(12, 31, @y - 1) if(wn[0] == 0)

    len = get_month_len

    if(len == 30) then
      wn << week_num(@m, 30, @y)
    elsif(len == 29) then
      wn << week_num(@m, 29, @y)
    elsif(len == 31) then
#      f = week_num(@m, 29, @y)
      g = week_num(@m, 30, @y)
      h = week_num(@m, 31, @y)
      g == h ? wn << g : wn << g << h
    elsif(len == 28) then
      g = week_num(@m, 22, @y)
      h = week_num(@m, 28, @y)
      wn << h if(g != h)
    end

    load_g_array

    center(21, "#{MONTH_NAMES[@m]} #{@y}")
    puts WEEK["g"]

    j = 0
    @cal.length.times do |x|
      if(x % 7 == 0) && (x != 0) then
        printf("\t%s\n", wn[j])
        j += 1
      end
      if(x - (@first - 1) == @d) && (x - (@first - 1) < 10) && (@d > 0) then
        printf("\e[7m %d\e[27m ", @d)
      elsif(x - (@first - 1) == @d) && (x - (@first - 1) > 9) && (@d > 0) then
        printf("\e[7m%d\e[27m ", @d)
      else
        print(@cal[x])
      end
    end
    puts
  end

  def julian_day_to_gregorian_day(jdn)
    jdn = jdn.to_i

    l = jdn + 68569
    n = (4 * l) / 146097
    l = l - (146097 * n + 3) / 4
    i = (4000 * (l + 1)) / 1461001
    l = l - (1461 * i) / 4 + 31
    j = (80 * l) / 2447
    gday = l - (2447 * j) / 80
    l = j / 11
    gmonth = j + 2 - (12 * l)
    gyear = 100 * (n - 49) + i + l

    [gmonth, gday, gyear]
  end

  def gregorian_date_to_julian_date(m, d, y)
    initialize(m, d, y)
    m, d, y = m.to_i, d.to_i, y.to_i

    aa = (14 - m) / 12
    yy = y + 4800 - aa
    mm = m + 12 * aa - 3
    d + (153 * mm + 2) / 5 + 365 * yy + yy / 4 - yy / 100 + yy / 400 - 32045
  end

  def diff_date_1(m, d, y)
    initialize(@m, @d, @y)
    jdn1 = gregorian_date_to_julian_date(m, d, y)
    jdn2 = gregorian_date_to_julian_date(MONTH, DAY, YEAR)

    jdiff = jdn2 - jdn1
    puts("#{jdiff} days")

    ydiff = jdiff.to_f / 365
    printf("%.2f %s\n", ydiff, "years")
  end

  def diff_date_2(m1, d1, y1, m2, d2, y2)
    initialize(@m, @d, @y)
    jdn1 = gregorian_date_to_julian_date(m1, d1, y1)
    jdn2 = gregorian_date_to_julian_date(m2, d2, y2)

    jdiff = jdn2 - jdn1
    puts("#{jdiff} days")

    ydiff = jdiff.to_f / 365
    printf("%.2f %s\n", ydiff, "years")
  end

  def western_easter(y)
    y = y.to_i

    a = y % 19
    b = y / 100
    c = y % 100
    d = b / 4
    e = b % 4
    f = (b + 8) / 25
    g = (b - f + 1) / 3
    h = (19 * a + b - d - g + 15) % 30
    i = c / 4
    k = c % 4
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) / 451
    month = (h + l - 7 * m + 114) / 31
    p = (h + l - 7 * m + 114) % 31
    day = p + 1

   [ month, day, y ]
  end

  def shift_month_forward
    if(@m == 12) then
      @m = 1
      @y += 1
    else
      @m += 1
    end
    @d = 0
  end

  def shift_month_backward
    if(@m == 1) then
      @m = 12
      @y -= 1
    else
      @m -= 1
    end
    @d = 0
  end

  def convert_to_gregorian
    if(@y > 1583) && (@y < 1699) then 10
    elsif (@y > 1700) && (@y < 1799) then 11
    elsif (@y > 1800) && (@y < 1899) then 12
    elsif (@y > 1900) && (@y < 2099) then 13
    elsif (@y > 2100) && (@y < 2199) then 14
    elsif (@y > 2200) && (@y < 2299) then 15
    elsif (@y > 2300) && (@y < 2499) then 16
    elsif (@y > 2500) && (@y < 2599) then 17
    elsif (@y > 2600) && (@y < 2699) then 18
    elsif (@y > 2700) && (@y < 2899) then 19
    elsif (@y > 2900) && (@y < 2999) then 20
    elsif (@y > 3000) && (@y < 3099) then 21
    elsif (@y > 3100) && (@y < 3299) then 22
    elsif (@y > 3300) && (@y < 3399) then 23
    end
  end

  def sept_1752
puts("
   September 1752     
Su Mo Tu We Th Fr Sa  
       1  2 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
                      
                      
")
  end

  def ordinal(x)
    x = x.to_s

    if x.to_i <= 20
      case x.to_i
        when 1 then "#{x}st"
        when 2 then "#{x}nd"
        when 3 then "#{x}rd"
        when 0, 4..20 then "#{x}th"
      end
    else
      case x[x.length-2,2].to_i
        # Stop here if triggered.
        when 11, 12 then return "#{x}th"
      end
      case x[x.length-1].to_i
        when 1 then "#{x}st"
        when 2 then "#{x}nd"
        when 3 then  "#{x}rd"
        when 0, 4..9 then "#{x}th"
      end
    end
  end

  def to_html
    initialize(@m, @d, @y)
    load_g_array

    top = <<eof
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>#{MONTH_NAMES[@m]} #{@y}</title>
<style type="text/css">
eof

wbar = <<eof
</style>
</head>
<body>
<table class="center">
	<tr> <td class="month" colspan="7">#{MONTH_NAMES[@m]} #{@y}</td> </tr>
	<tr> <td class="weekbar">Sun</td>
	     <td class="weekbar">Mon</td>
             <td class="weekbar">Tue</td>
             <td class="weekbar">Wed</td>
             <td class="weekbar">Thu</td>
             <td class="weekbar">Fri</td>
             <td class="weekbar">Sat</td> </tr>

eof

css = <<eof
body { background: #808080; }

table {
	background: #000000;
	border: 2px solid #000000; }

table.center {
        margin-left:auto;
        margin-right:auto; }

.month {
	font-size: 50px;
	word-spacing: 0.5em;
	color: #FFFFFF;
	font-weight: bold; }

td {
	font-family: Arial;
	text-align: center;
	font-size: 25px;
	width: 82px;    
	height: 82px;
	padding: 0px;
	font-weight: bold; }

.weekbar {
	height: 10px;
	background: #232323;
	color: #FFFFFF; }

.sunday {
	background-color: #606060;
	color: #FFFFFF;
	font-style: italic; }

.weekday {
	background-color: #C0C0C0; }

.today {
	background-color: #FF0000;
	font-size: 35px;
	color: #FFFFFF; }
	
.today:hover {
	background-color: #000000;
	color: #FF0000; }

@media only print
{
        body {
                background: white;
                color: black; }
        .sunday { font-size: 30px; }
        .weekday {
                font-size: 30px;
                font-weight: normal; }
        .today { text-decoration: underline; }
}
eof

  if (@cal[29].to_s.strip == "") then
    pr = 4
  elsif(@cal[35].to_s.strip == "") then
    pr = 5
  else
    pr = 6
  end

  su, mo, tu, we, th, fr, sa = 0, 1, 2, 3, 4, 5, 6
  row = 0

  puts top
  puts css
  puts wbar

  @d = @d.to_s.strip

  until (row == pr)
    if(@cal[su].to_s.strip == @d) then
      printf("\t    <tr> <td class=\"today\">#{@cal[su]} </td> <!--today-->\n")
    else
      printf("\t    <tr> <td class=\"sunday\">#{@cal[su]} </td>\n")
    end

    if(@cal[mo].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[mo]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[mo]} </td>\n")
    end

    if(@cal[tu].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[tu]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[tu]} </td>\n")
    end

    if(@cal[we].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[we]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[we]} </td>\n")
    end

    if(@cal[th].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[th]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[th]} </td>\n")
    end

    if(@cal[fr].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[fr]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[fr]} </td>\n")
    end

    if(@cal[sa].to_s.strip == @d) then
      printf("\t\t <td class=\"today\">#{@cal[sa]} </td> <!--today-->\n")
    else
      printf("\t\t <td class=\"weekday\">#{@cal[sa]} </td> </tr>\n")
    end
    puts

    su += 7
    mo += 7
    tu += 7
    we += 7
    th += 7
    fr += 7
    sa += 7
    row += 1
  end

  bottom = <<eof
</table>
</body>
</html>
eof

  puts bottom
  end

  def month3
    shift_month_backward
    load_g_array
    c = get_array
    c1_row1 = c[0,7].join
    c1_row2 = c[7,7].join
    c1_row3 = c[14,7].join
    c1_row4 = c[21,7].join
    c1_row5 = c[28,7].join
    c1_row6 = c[35,7].join
    m = get_month_name
    s = m + get_year.to_s
    printf("%*s", ((21 + s.length) / 2), "#{m} #{y}")
    printf("%*s", 21 - ((21 + s.length) / 2) + 2, "")

    shift_month_forward
    load_g_array
    c = get_array
    c2_row1 = c[0,7].join
    c2_row2 = c[7,7].join
    c2_row3 = c[14,7].join
    c2_row4 = c[21,7].join
    c2_row5 = c[28,7].join
    c2_row6 = c[35,7].join
    m = get_month_name
    s = m + get_year.to_s
    printf("%*s", ((21 + s.length) / 2), "#{m} #{y}")
    printf("%*s", 21 - ((21 + s.length) / 2) + 2, "")

    shift_month_forward
    load_g_array
    c = get_array
    c3_row1 = c[0,7].join
    c3_row2 = c[7,7].join
    c3_row3 = c[14,7].join
    c3_row4 = c[21,7].join
    c3_row5 = c[28,7].join
    c3_row6 = c[35,7].join
    m = get_month_name
    s = m + get_year.to_s
    printf("%*s\n", ((21 + s.length) / 2), "#{m} #{y}")

    puts "#{WEEK["g"]}   " * 3
    print c1_row1, "  ", c2_row1, "  ", c3_row1; puts
    print c1_row2, "  ", c2_row2, "  ", c3_row2; puts
    print c1_row3, "  ", c2_row3, "  ", c3_row3; puts
    print c1_row4, "  ", c2_row4, "  ", c3_row4; puts
    print c1_row5, "  ", c2_row5, "  ", c3_row5; puts
    print c1_row6, "  ", c2_row6, "  ", c3_row6; puts
  end

  def yearly
    initialize(@m, @d, @y)

    y = get_year.to_s
    printf("\n%*d\n\n", ((64 + y.size) / 2 + 1), "#{y}")

    @m = 0
    (1..4).each do | |
      @m += 1
      load_g_array
      c = get_array
      c1_row1 = c[0,7].join
      c1_row2 = c[7,7].join
      c1_row3 = c[14,7].join
      c1_row4 = c[21,7].join
      c1_row5 = c[28,7].join
      c1_row6 = c[35,7].join
      m = get_month_name
      y = get_year
      printf("%*s", ((21 + m.length) / 2), "#{m}")
      printf("%*s", 21 - ((21 + m.length) / 2) + 2, "")

      @m += 1
      load_g_array
      c = get_array
      c2_row1 = c[0,7].join
      c2_row2 = c[7,7].join
      c2_row3 = c[14,7].join
      c2_row4 = c[21,7].join
      c2_row5 = c[28,7].join
      c2_row6 = c[35,7].join
      m = get_month_name
      printf("%*s", ((21 + m.length) / 2), "#{m}")
      printf("%*s", 21 - ((21 + m.length) / 2 - 1), "")

      @m += 1
      load_g_array
      c = get_array
      c3_row1 = c[0,7].join
      c3_row2 = c[7,7].join
      c3_row3 = c[14,7].join
      c3_row4 = c[21,7].join
      c3_row5 = c[28,7].join
      c3_row6 = c[35,7].join
      m = get_month_name
      printf("%*s\n", ((21 + m.length) / 2), "#{m}")

      puts "#{WEEK["g"]}   " * 3
      print c1_row1, "  ", c2_row1, "  ", c3_row1; puts
      print c1_row2, "  ", c2_row2, "  ", c3_row2; puts
      print c1_row3, "  ", c2_row3, "  ", c3_row3; puts
      print c1_row4, "  ", c2_row4, "  ", c3_row4; puts
      print c1_row5, "  ", c2_row5, "  ", c3_row5; puts
      print c1_row6, "  ", c2_row6, "  ", c3_row6; puts
    end
  end

  def j_yearly
    initialize(@m, @d, @y)

    y = get_year.to_s
    printf("\n%*d\n\n", ((58 + y.size) / 2), "#{y}")

    @m = 0
    (1..6).each do | |
      @m += 1
      load_j_array
      c = get_array
      c1_row1 = c[0,7].join
      c1_row2 = c[7,7].join
      c1_row3 = c[14,7].join
      c1_row4 = c[21,7].join
      c1_row5 = c[28,7].join
      c1_row6 = c[35,7].join
      m = get_month_name
      y = get_year
      printf("%*s", ((28 + m.length) / 2), "#{m}")
      printf("%*s", 28 - ((28 + m.length) / 2) + 2, "")

      @m += 1
      load_j_array
      c = get_array
      c2_row1 = c[0,7].join
      c2_row2 = c[7,7].join
      c2_row3 = c[14,7].join
      c2_row4 = c[21,7].join
      c2_row5 = c[28,7].join
      c2_row6 = c[35,7].join
      m = get_month_name
      y = get_year
      printf("%*s\n", ((28 + m.length) / 2), "#{m}")

      puts "#{WEEK["j"]}   " * 2
      print c1_row1, "  ", c2_row1; puts
      print c1_row2, "  ", c2_row2; puts
      print c1_row3, "  ", c2_row3; puts
      print c1_row4, "  ", c2_row4; puts
      print c1_row5, "  ", c2_row5; puts
      print c1_row6, "  ", c2_row6; puts
    end
  end

end

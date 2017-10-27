class Ncal < Calendar

  WEEKS = [ "Su ", "Mo ", "Tu ", "We ", "Th ", "Fr ", "Sa " ].freeze

  def initialize(m, d, y)
    super(m, d, y)
  end

  def load_ncal_array
    load_g_array
    c = get_array

    @rows = [
        c[0], c[7], c[14], c[21], c[28], c[35],
        c[1], c[8], c[15], c[22], c[29], c[36],
        c[2], c[9], c[16], c[23], c[30], c[37],
        c[3], c[10], c[17], c[24], c[31], c[38],
        c[4], c[11], c[18], c[25], c[32], c[39],
        c[5], c[12], c[19], c[26], c[33], c[40],
        c[6], c[13], c[20], c[27], c[34], c[41],
        ].freeze
  end

  def load_j_ncal_array
    load_j_array
    c = get_array

    @rows = [
        c[0], c[7], c[14], c[21], c[28], c[35],
        c[1], c[8], c[15], c[22], c[29], c[36],
        c[2], c[9], c[16], c[23], c[30], c[37],
        c[3], c[10], c[17], c[24], c[31], c[38],
        c[4], c[11], c[18], c[25], c[32], c[39],
        c[5], c[12], c[19], c[26], c[33], c[40],
        c[6], c[13], c[20], c[27], c[34], c[41],
        ].freeze
  end

  def print_ncal
    initialize(@m, @d, @y)

    load_ncal_array

    puts "    #{MONTH_NAMES[@m]} #{@y}"

    t = -1
    @rows.length.times do |i|
      if(i == 0)
        print WEEKS[t+=1]
      elsif(i % 6 == 0)
        puts
        print WEEKS[t+=1]
      end
      if(@rows[i].to_i == @d.to_i) && (@rows[i].to_i < 10) && (@d > 0) then
        printf("\e[7m %d\e[27m ", @d)
      elsif(@rows[i].to_i == @d.to_i) && (@rows[i].to_i > 9) && (@d > 0) then
        printf("\e[7m%d\e[27m ", @d)
      else
        print(@rows[i])
      end
    end
    puts
  end 

  def j_print_ncal
    initialize(@m, @d, @y)

    load_j_ncal_array

    puts "    #{MONTH_NAMES[@m]} #{@y}"

    jd = get_diy

    t = -1
    @rows.length.times do |i|
      if(i == 0)
        print WEEKS[t+=1]
      elsif(i % 6 == 0)
        puts
        print WEEKS[t+=1]
      end
      if(@rows[i].to_i == jd) && (@rows[i].to_i < 10) && (jd > 0) then
        printf("\e[7m  %d\e[27m ", jd)
      elsif(@rows[i].to_i == jd) && (@rows[i].to_i > 9) && (@rows[i].to_i < 100) && (jd > 0) then
        printf("\e[7m %d\e[27m ", jd)
      elsif(@rows[i].to_i == jd) && (@rows[i].to_i > 99) && (jd > 0) then
        printf("\e[7m%d\e[27m ", jd)
      else
        print(@rows[i])
      end    
    end
    puts
  end 

  def ncal_yearly
    initialize(@m, @d, @y)

    y = get_year.to_s
    printf("\n%*d\n\n", ((74 + y.size) / 2), "#{y}")

    @m = 0
    (1..3).each do | |
      @m += 1
      load_ncal_array
      c1_row1 = @rows[0,6].join
      c1_row2 = @rows[6,6].join
      c1_row3 = @rows[12,6].join
      c1_row4 = @rows[18,6].join
      c1_row5 = @rows[24,6].join
      c1_row6 = @rows[30,6].join
      c1_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s", "    #{m}")
      printf("%*s", 18 - m.length, "")

      @m += 1
      load_ncal_array
      c2_row1 = @rows[0,6].join
      c2_row2 = @rows[6,6].join
      c2_row3 = @rows[12,6].join
      c2_row4 = @rows[18,6].join
      c2_row5 = @rows[24,6].join
      c2_row6 = @rows[30,6].join
      c2_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s", " #{m}")
      printf("%*s", 18 - m.length, "")

      @m += 1
      load_ncal_array
      c3_row1 = @rows[0,6].join
      c3_row2 = @rows[6,6].join
      c3_row3 = @rows[12,6].join
      c3_row4 = @rows[18,6].join
      c3_row5 = @rows[24,6].join
      c3_row6 = @rows[30,6].join
      c3_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s", " #{m}")
      printf("%*s", 18 - m.length, "")

      @m += 1
      load_ncal_array
      c4_row1 = @rows[0,6].join
      c4_row2 = @rows[6,6].join
      c4_row3 = @rows[12,6].join
      c4_row4 = @rows[18,6].join
      c4_row5 = @rows[24,6].join
      c4_row6 = @rows[30,6].join
      c4_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s\n", " #{m}")

      print WEEKS[0], c1_row1, " ", c2_row1, " ", c3_row1, " ", c4_row1 ; puts
      print WEEKS[1], c1_row2, " ", c2_row2, " ", c3_row2, " ", c4_row2 ; puts
      print WEEKS[2], c1_row3, " ", c2_row3, " ", c3_row3, " ", c4_row3 ; puts
      print WEEKS[3], c1_row4, " ", c2_row4, " ", c3_row4, " ", c4_row4 ; puts
      print WEEKS[4], c1_row5, " ", c2_row5, " ", c3_row5, " ", c4_row5 ; puts
      print WEEKS[5], c1_row6, " ", c2_row6, " ", c3_row6, " ", c4_row6 ; puts
      print WEEKS[6], c1_row7, " ", c2_row7, " ", c3_row7, " ", c4_row7 ; puts
      puts
    end
  end

  def j_ncal_yearly
    initialize(@m, @d, @y)

    y = get_year.to_s
    printf("\n%*d\n\n", ((72 + y.size) / 2), "#{y}")

    @m = 0
    (1..4).each do | |
      @m += 1
      load_j_ncal_array
      c1_row1 = @rows[0,6].join
      c1_row2 = @rows[6,6].join
      c1_row3 = @rows[12,6].join
      c1_row4 = @rows[18,6].join
      c1_row5 = @rows[24,6].join
      c1_row6 = @rows[30,6].join
      c1_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s", "    #{m}")
      printf("%*s", 21 - m.length, "")

      @m += 1
      load_j_ncal_array
      c2_row1 = @rows[0,6].join
      c2_row2 = @rows[6,6].join
      c2_row3 = @rows[12,6].join
      c2_row4 = @rows[18,6].join
      c2_row5 = @rows[24,6].join
      c2_row6 = @rows[30,6].join
      c2_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s", "    #{m}")
      printf("%*s", 21 - m.length, "")

      @m += 1
      load_j_ncal_array
      c3_row1 = @rows[0,6].join
      c3_row2 = @rows[6,6].join
      c3_row3 = @rows[12,6].join
      c3_row4 = @rows[18,6].join
      c3_row5 = @rows[24,6].join
      c3_row6 = @rows[30,6].join
      c3_row7 = @rows[36,6].join
      m = get_month_name
      y = get_year
      printf("%s\n", "    #{m}")

      print WEEKS[0], c1_row1, " ", c2_row1, " ", c3_row1 ; puts
      print WEEKS[1], c1_row2, " ", c2_row2, " ", c3_row2 ; puts
      print WEEKS[2], c1_row3, " ", c2_row3, " ", c3_row3 ; puts
      print WEEKS[3], c1_row4, " ", c2_row4, " ", c3_row4 ; puts
      print WEEKS[4], c1_row5, " ", c2_row5, " ", c3_row5 ; puts
      print WEEKS[5], c1_row6, " ", c2_row6, " ", c3_row6 ; puts
      print WEEKS[6], c1_row7, " ", c2_row7, " ", c3_row7 ; puts
      puts
    end
  end

end

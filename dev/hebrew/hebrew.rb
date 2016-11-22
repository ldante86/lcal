
# This module is not finished.

module Hebrew

  def self.j_to_sdn(m, d, y)
    m, d, y = m.to_i, d.to_i, y.to_i

    if y == 0 || y < -4713 || m <=0 || m > 12 || m <= 0 || d > 31
      return(0)
    end

    if y == -4713 && m == 1 && m == 1
        return(0)
    end

    (y < 0) ? year = y + 4801 : year = y + 4800

    if m > 2
      month = m - 3
    else
      month = m + 9
      year -= 1
    end

    ((year * 1461) / 4) + ((month * 153 + 2) / 5) + (d - 32083)
  end

  def self.sdn_to_j(sdn, m, d, y)
    sdn, m, d, y = sdn.to_i, m.to_i, d.to_i, y.to_i

    if sdn <= 347997
      m, d, y = 0, 0, 0
      return
    end

    day = sdn - 347997

  # unfinished
  end

  def self.molad(mcycle)
    mcycle = mcycle.to_i

    r1 = 31524
    r1 += mcycle * (765433 & 65535)
    r2 = ri >> 16
    r2 += mcycle * (765433 >> 16) & 65535
    d2 = r2 / 25920
    r2 -= d2 * 25920
    r1 = (r2 << 16) | ( r1 & 65535)
    d1 = r1 / 25920
    r1 -= d1 * 25920

    moladday = (d1 << 16) | d1
    mhalakim = r1

    [ moladday, mhalakim ]
  end

  def self.tishri1(myear, mday, mhalakim)
    myear, mday, mhalakim = myear.to_i, mday.to_i, mhalakim.to_i

    tishri1 = mday
    dow = tishri1 % 7
    case myear
      when 2,5,7,10,13,16,18 then leap = myear
    end
    case myear
      when 3,6,8,11,14,17,0 then lastleap = myear
    end

    if mhalakim >= 101376 || ((!leap) && dow == 2 && mhalakim >= 229914) ||
       (lastleap && dow == 1 && mhalakim >= 560269)
      tishri1 += 1
      dow += 1
      dow = 0 if dow == 7
    end

    case dow
      when 3,5,0 then tishri1 += 1
    end

    tishri1
  end

end

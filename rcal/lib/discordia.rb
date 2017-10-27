class Discordia < Calendar

  WEEKDAY = [
	"Sweetmorn",
	"Boomtime",
	"Pungenday",
	"Prickle-Prickle",
	"Setting Orange"
	].freeze

  APOSTLE = [
	"Mungday",
	"Mojoday",
	"Syaday",
	"Zaraday",
	"Maladay"
	].freeze

  HOLYDAY = [
	"Chaoflux",
	"Discoflux",
	"Confuflux",
	"Bureflux",
	"Afflux"
	].freeze

  SEASONS = [
	"Chaos",
	"Discord",
	"Confusion",
	"Bureaucracy",
	"The Aftermath"
	].freeze

  def initialize(m, d, y)
    super(m, d, y)
  end

  def print_discordian_date
    initialize(@m, @d, @y)
    year = @y + 1166

    if(get_month_len == 29) && (@m == 2) && (@d == 29) then
      puts("St. Tib's Day, #{year} YOLD")
      exit
    end

    dayofyear = get_diy

    if(is_leap(@y) == 29) && (dayofyear >= 60) then
      dayofyear -= 1
    end

    seasonday = dayofyear % 73
    seasonday = 73 if(seasonday == 0)

    case seasonday
    when 5 then
      puts("Today is #{APOSTLE[dayofyear / 73]}, in the YOLD #{year}")
      exit
    when 50 then
      puts("Today is #{HOLYDAY[dayofyear / 73]}, in the YOLD #{year}")
      exit
    else
      case dayofyear
      when 73, 146, 219, 291, 365 then
        season = SEASONS[(dayofyear / 73) - 1]
      else
        season = SEASONS[(dayofyear / 73)]
      end
    end

    dayofweek = WEEKDAY[(dayofyear - 1) % 5]

    ord = ordinal(seasonday)
    puts("Today is #{dayofweek}, the #{ord} day of #{season} in the YOLD #{year}")
  end

end

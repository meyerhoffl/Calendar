require "initiate.rb"

class Cal
  attr_reader :month, :year
  attr_accessor

  def initialize(month, year)
    @month = month
    @year = year
    @month_names = %w[January February March April May June July August September October November December]
    @day_names = %w[Saturday Sunday Monday Tuesday Wednesday Thursday Friday]
    @thirtyone = [1,3,5,7,8,10,12]

  end

  def get_header
    x = @month_names[@month.to_i-1]
    "#{x} " + "#{@year}"
  end

  def leap_year
    if @year % 400 == 0
      true
    elsif @year % 100 == 0
      false
    elsif @year % 4 == 0
      true
    else
      false
    end
  end

  def zellers
    # h = @day_names
    # q = 1
    # m = @month
    # Y = @year
    # K = (@year % 100)
    # J = (@year/100)
    if @month == 1 || @month == 2
      @month += 12
      @year -= 1
      h = (1 + ((@month + 1) * 26/10) + @year + @year/4 + 6 *(@year/100) + (@year/400)) % 7
    else
      h = (1 + ((@month + 1) * 26/10) + @year + @year/4 + 6 *(@year/100) + (@year/400)) % 7
    end
  end


  def weeks_in_month
    if zellers == 0 && @month != 2
      6
    elsif zellers == 6 && @thirtyone.include?(@month)
      6
    elsif zellers == 1 && leap_year
        4
    else
      return 5
    end
  end

end
# cal = Cal.new(some, arguments)
# cal.print_cal
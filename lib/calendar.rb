require "initiate.rb"

class Cal
  attr_reader :month, :year
  attr_accessor


  def initialize(month, year)
    @month = month
    @year = year
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
    # h =
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
    thirtyone = [1,3,5,7,8,10,12]
    if zellers == 0 && @month != 2
      6
    elsif zellers == 6 && thirtyone.include?(@month)
      6
    elsif zellers == 1 && leap_year
        4
    else
      return 5
    end
  end


  def get_header
    month_names = %w[January February March April May June July August September October November December]
    x = month_names[@month.to_i-1]
    string = "#{x} " + "#{@year}"
    string.center(20).rstrip + "\n"
  end

  def get_week_days
    days = %w[Su Mo Tu We Th Fr Sa]
    days.join(" ") + "\n"
  end


  def number_of_days_in_month
    thirtyone = [1,3,5,7,8,10,12, 13]
    thirty = [9,4,6,11]
    if thirtyone.include?(@month)
      31
    elsif thirty.include?(@month)
      30
    elsif leap_year == true
      29
    else
      28
    end
  end

  def modified_zellers
    if zellers == 0
      7
    else
      zellers
    end
  end


  def return_month

    days = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    days_collection = []
    z = 1
    shifting = 7

    days_collection << get_header
    days_collection << get_week_days

      if number_of_days_in_month == 30
        days = days.shift(30)
      elsif number_of_days_in_month == 28
        days = days.shift(28)
      elsif number_of_days_in_month == 29
        days = days.shift(29)
      end

      while z < 8
        if modified_zellers == z
          week1 = days.shift(shifting)
          weekone = week1.join(" ").rjust(20) + "\n"
        end
        z += 1
        shifting -= 1
      end
      days_collection << weekone

        5.times do
          week = days.shift(7)
          regweek = week.join(" ") + "\n"
          days_collection << regweek
        end
        days_collection.join("")
  end
end

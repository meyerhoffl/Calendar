class Cal
  attr_reader :month, :year


  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end


  def leap_year?
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end


  def weekday_of_first
    # This block of code uses Zeller's congruence to determine which day of the week the first falls on each month.
    # The code returns 0 for Saturday, 1 for Sunday, 2 for Monday, etc.
    # Visit http://en.wikipedia.org/wiki/Zeller's_congruence for more information on Zeller's congruence.
    # q = 1
    # m = @month
    # Y = @year
    # K = (@year % 100)
    # J = (@year/100)
    if @month == 1 || @month == 2
      @month += 12
      @year -= 1
    end
      h = (1 + ((@month + 1) * 26/10) + @year + @year/4 + 6 *(@year/100) + (@year/400)) % 7
  end


  def weeks_in_month
    thirtyone = [1,3,5,7,8,10,12]
    if weekday_of_first == 0 && month != 2
      6
    elsif weekday_of_first == 6 && thirtyone.include?(month)
      6
    elsif weekday_of_first == 1 && leap_year?
        4
    else
      return 5
    end
  end


  def get_header
    month_names = %w[January February March April May June July August September October November December]
    month_name = month_names[month.to_i-1]
    string = "#{month_name} " + "#{year}"
    string.center(20).rstrip + "\n"
  end


  def get_week_days
    "Su Mo Tu We Th Fr Sa\n"
  end


  def number_of_days_in_month
    thirtyone = [1,3,5,7,8,10,12, 13]
    thirty = [9,4,6,11]
    if thirtyone.include?(month)
      31
    elsif thirty.include?(month)
      30
    elsif leap_year? == true
      29
    else
      28
    end
  end


  def reorder_week
# This block of code modifies the weekday_of_first method to return 7 for Saturday instead of 0.
# This adjustment simplifies the process of printing the first week of each month in the return_month method.
    if weekday_of_first == 0
      7
    else
      weekday_of_first
    end
  end


  def return_month

    days = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    formatted_month = []
    day_selection = 7

    formatted_month << get_header
    formatted_month << get_week_days

    days = days.shift(number_of_days_in_month)

    week_length = 8
    first_of_month = 1

    while first_of_month < week_length
      if reorder_week == first_of_month
        week1 = days.shift(day_selection)
        week1 = week1.join(" ").rjust(20) + "\n"
      end
      first_of_month += 1
      day_selection -= 1
    end
      formatted_month << week1

    5.times do
      week = days.shift(7)
      regweek = week.join(" ") + "\n"
      formatted_month << regweek
    end
      formatted_month.join("")
  end
end



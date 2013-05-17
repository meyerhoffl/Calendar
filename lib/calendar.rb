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
      5
    end
  end

  def get_month_header
    month_names = %w[January February March April May June July August September October November December]
    month_name = month_names[month.to_i-1]
  end

  def format_month_header
    month_header = get_month_header + " #{@year}"
    header = month_header.center(20)
    header.rstrip
  end

  def get_week_days
    "Su Mo Tu We Th Fr Sa"
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

  def return_days_in_month
    days = ("01".."#{number_of_days_in_month}").to_a
    days.each do |x|
      x.gsub!(/0/, "\s") if x < "10"
    end

    days_formatted = []
    days_formatted << [format_month_header]
    days_formatted << [get_week_days]
    day_selection = 7

    week_length = 8
    first_of_month = 1

    while first_of_month < week_length
      if reorder_week == first_of_month
        week1 = days.shift(day_selection)
        week1 = [week1.join(" ").rjust(20)]
      end
      first_of_month += 1
      day_selection -= 1
    end
      days_formatted << week1

    5.times do
      week = days.shift(7)
      regweek = [week.join(" ").ljust(20)]
      days_formatted << regweek
    end
      days_formatted
  end

  def insert_month_line_breaks
    return_days_in_month.each do |x|
      x << "\n"
    end
  end

  def add_spacing
    if weeks_in_month == 4
      spacing = "\n\n\n"
    elsif weeks_in_month == 6
      spacing = "\n"
    else
      spacing = "\n\n"
    end
    spacing
  end

  def format_month
    insert_month_line_breaks.join.rstrip + add_spacing
  end
end



# month = ARGV[0]
# year = ARGV[1]
# if month == nil
#   year = ARGV[0]
#   Year.new(year).format_days
# else
#   Cal.new(month,year).format_month
# end



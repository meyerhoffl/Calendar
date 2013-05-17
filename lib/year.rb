require 'calendar.rb'

class Year
  attr_reader :year

  def initialize(year)
    @year = year.to_i
  end

  MONTH = ("1".."12").to_a

  def return_year_header
    "#{year}".center(62).rstrip + "\n\n"
  end

  def return_year_month_header
    month_collection = []
    month_header_formatted = []
    x = 0
    while x < MONTH.length
      month = Cal.new(MONTH[x], @year)
      month_collection << [month.get_month_header.center(20)]
      x +=1
    end
    4.times do
      month_header_formatted << month_collection.shift(3).join("  ").rstrip + "\n"
    end
    month_header_formatted
  end

  def return_year_days_of_week
    month = Cal.new(MONTH[1], @year)
    weekday_header = []
    3.times do
      weekday_header << month.get_week_days
    end
    weekday_header.join("  ") + "\n"
    end

  def return_year_days
    year_days = []
    counter = 0
    while counter < MONTH.length
      month = Cal.new(MONTH[counter], @year)
      counter +=1
      year_days << month.return_days_in_month
    end
    year_days
  end

  def format_year
    month_array = []
    local_month_header = return_year_month_header
    month_array << return_year_header
    month = 0
    4.times do
      line = 2
      month_array << local_month_header.shift(1)
      month_array << return_year_days_of_week
      6.times do
        month_array << return_year_days[0 + month][line] << "  "
        month_array << return_year_days[1 + month][line] << "  "
        month_array << return_year_days[2 + month][line].join.rstrip
        month_array << "\n"
        line += 1
      end
      month += 3
    end
    month_array.join
  end
end
    require_relative "lib/calendar.rb"
    month = ARGV[0]
    year = ARGV[1]
    # puts `cal #{month} #{year}`

cal = Cal.new(month,year)
puts cal.return_month
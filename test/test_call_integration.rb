require 'test/unit'
require 'calendar.rb'

class CalIntegrationTest < Test::Unit::TestCase


  def test_1_1
    month = ARGV[0]
    year = ARGV[1]
    puts `cal #{month} #{year}`
  end
end




  # def test_01_print_month
  #   month = "January"
  #   assert_equal(month, 1)
  # end

  # def test_01_print_year
  #   year = 1800
  #   assert_equal(year, 1800)
  # end

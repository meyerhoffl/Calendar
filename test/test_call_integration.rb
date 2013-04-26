require 'test/unit'


class CalIntegrationTest < Test::Unit::TestCase


  def test_1
    assert_equal(`cal 2 2012`, `ruby calendar.rb 2 2012`)
  end
end


  # def test_02_return_month(0)
  #   assert_equal(month, "January")
  # end

  # def test_01_print_year
  #   year = 1800
  #   assert_equal(year, 1800)
  # end

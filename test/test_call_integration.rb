
require "./lib/initiate"

class CalIntegrationTest < Test::Unit::TestCase


  def test_01_is_it_working
    assert_equal(`cal 2 2013`, `ruby ./lib/initiate.rb 2 2013`)
  end

    def test_02_leap_year
    cal = Cal.new(2, 2012)
    assert_equal(cal.leap_year, true)
  end

   def test_03_leap_year
    cal = Cal.new(2, 2009)
    assert_equal(cal.leap_year, false)
  end

  def test_04_zellers_jan
    cal = Cal.new(1, 2013)
    assert_equal(cal.zellers, 3)
  end

  def test_05_zellers_feb
    cal = Cal.new(2, 2013)
    assert_equal(cal.zellers, 6)
  end

  def test_06_zellers_rest_of_year
    cal = Cal.new(7, 2013)
    assert_equal(cal.zellers, 2)
  end

  def test_07_number_of_weeks_in_month_5
    cal = Cal.new(1, 2013)
    assert_equal(cal.weeks_in_month, 5)
  end

  def test_08_number_of_weeks_in_month_6
    cal = Cal.new(6, 2013)
    assert_equal(cal.weeks_in_month, 6)
  end

  def test_09_number_of_weeks_in_month_4
    cal = Cal.new(2, 2009)
    assert_equal(cal.weeks_in_month, 4)
  end
end



require 'test/unit'
require "./lib/calendar"
class CalTest < Test::Unit::TestCase

  def test_02_get_header
    cal = Cal.new(4, 2013)
    assert_equal(cal.get_header, 'April 2013')
  end

  def test_03_leap_year
    cal = Cal.new(2, 2012)
    assert_equal(cal.leap_year, true)
  end

   def test_04_leap_year
    cal = Cal.new(2, 2009)
    assert_equal(cal.leap_year, false)
  end

  def test_05_zeller_jan
    cal = Cal.new(1, 2013)
    assert_equal(cal.zellers, 3)
  end

  def test_06_zeller_feb
    cal = Cal.new(2, 2013)
    assert_equal(cal.zellers, 6)
  end

  def test_07_zeller_rest_of_year
    cal = Cal.new(7, 2013)
    assert_equal(cal.zellers, 2)
  end

  def test_08_number_of_weeks_in_month
    cal = Cal.new(1, 2013)
    assert_equal(cal.weeks_in_month, 5)
  end

  def test_09_number_of_weeks_in_month
    cal = Cal.new(6, 2013)
    assert_equal(cal.weeks_in_month, 6)
  end

  def test_10_number_of_weeks_in_month
    cal = Cal.new(2, 2009)
    assert_equal(cal.weeks_in_month, 4)
  end

end



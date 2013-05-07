require 'test/unit'
require './lib/calendar'
class CalTest < Test::Unit::TestCase

  def test_01_is_leap_year
    cal = Cal.new(2, 2012)
    assert_equal(true, cal.leap_year?)
  end

  def test_02_is_not_leap_year
    cal = Cal.new(2, 2009)
    assert_equal(false, cal.leap_year?)
  end

  def test_03_zellers_jan
    cal = Cal.new(1, 2013)
    assert_equal(3, cal.weekday_of_first)
  end

  def test_04_zellers_feb
    cal = Cal.new(2, 2013)
    assert_equal(6, cal.weekday_of_first)
  end

  def test_05_zellers_rest_of_year
    cal = Cal.new(7, 2013)
    assert_equal(2, cal.weekday_of_first)
  end

  def test_06_5_weeks_in_month
    cal = Cal.new(1, 2013)
    assert_equal(5, cal.weeks_in_month)
  end

  def test_07_6_weeks_in_month
    cal = Cal.new(6, 2013)
    assert_equal(6, cal.weeks_in_month)
  end

  def test_08_4_weeks_in_month
    cal = Cal.new(2, 2009)
    assert_equal(4, cal.weeks_in_month)
  end

  def test_09_get_month_header
    cal = Cal.new(4, 2013)
    assert_equal("     April 2013\n", cal.get_header)
  end

  def test_10_get_week_day_header
    cal = Cal.new(4, 2013)
    assert_equal("Su Mo Tu We Th Fr Sa\n", cal.get_week_days)
  end

  def test_11_30_days_in_month
    cal = Cal.new(4, 2013)
    assert_equal(30, cal.number_of_days_in_month)
  end

  def test_12_28_days_in_month
    cal = Cal.new(2, 2013)
    assert_equal(28, cal.number_of_days_in_month)
  end

  def test_13_29_days_in_month
    cal = Cal.new(2, 2012)
    assert_equal(29, cal.number_of_days_in_month)
  end

  def test_14_31_days_in_month
    cal = Cal.new(1, 2013)
    assert_equal(31, cal.number_of_days_in_month)
  end

  def test_reorder_week_Sunday_1
    cal = Cal.new(12, 2013)
    assert_equal(1, cal.reorder_week)
  end

  def test_16_modified_zellers_Saturday_7
    cal = Cal.new(6, 2013)
    assert_equal(7, cal.reorder_week)
  end

  def test_17_return_month_1st_on_Sunday
    cal = Cal.new(1, 2012)
    assert_equal("    January 2012\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30 31\n\n", cal.return_month)
  end

  def test_18_return_month_1st_on_Saturday
    cal = Cal.new(10, 2011)
    assert_equal("    October 2011\nSu Mo Tu We Th Fr Sa\n                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31\n", cal.return_month)
  end

  def test_19_return_month_1st_in_middle_of_week
    cal = Cal.new(8, 1917)
    assert_equal("    August 1917\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n", cal.return_month)
  end

  def test_20_return_month_leap_year
    cal = Cal.new(2, 2012)
    assert_equal("   February 2012\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n", cal.return_month)
  end

  def test_21_return_month_not_leap_year
    expected = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS
    cal = Cal.new(2, 2012)
    assert_equal(expected, cal.return_month)
  end

  def test_22_month_formatting_31_days
    expected = <<EOS
    August 3000
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    cal = Cal.new(8, 3000)
    assert_equal(expected, cal.return_month)
  end

  def test_23_month_formatting_30_days
    expected = <<EOS
     June 1800
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
  cal = Cal.new(6, 1800)
  assert_equal(expected, cal.return_month)
  end
end
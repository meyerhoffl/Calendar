require 'test/unit'
require "./lib/calendar"
class CalTest < Test::Unit::TestCase

  def test_10_get_header
    cal = Cal.new(4, 2013)
    assert_equal(cal.get_header, "     April 2013\n")
  end

  def test_11_get_week_days
    cal = Cal.new(4, 2013)
    assert_equal(cal.get_week_days, "Su Mo Tu We Th Fr Sa\n")
  end

  def test_12_days_in_month
    cal = Cal.new(4, 2013)
    assert_equal(cal.number_of_days_in_month, 30 )
  end

  def test_13_days_in_month
    cal = Cal.new(2, 2013)
    assert_equal(cal.number_of_days_in_month, 28 )
  end

  def test_14_days_in_month
    cal = Cal.new(2, 2012)
    assert_equal(cal.number_of_days_in_month, 29 )
  end

  def test_15_days_in_month
    cal = Cal.new(1, 2013)
    assert_equal(cal.number_of_days_in_month, 31 )
  end

  def test_16_modified_zellers
    cal = Cal.new(12, 2013)
    assert_equal(cal.modified_zellers, 1)
  end

  def test_17_modified_zellers
    cal = Cal.new(6, 2013)
    assert_equal(cal.modified_zellers, 7)
  end

  def test_18_return_month_01
    cal = Cal.new(1, 2012)
    assert_equal(cal.return_month,"    January 2012\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30 31\n\n")
  end

  def test_19_return_month_02
    cal = Cal.new(10, 2011)
    assert_equal(cal.return_month,"    October 2011\nSu Mo Tu We Th Fr Sa\n                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31\n")
  end

  def test_20_return_month_03
    cal = Cal.new(8, 1917)
    assert_equal(cal.return_month,"    August 1917\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n")
  end

  def test_21_return_month_04
    cal = Cal.new(2, 2012)
    assert_equal(cal.return_month,"   February 2012\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n")
  end

  def test_22_return_month_05
    cal = Cal.new(2, 2009)
    assert_equal(cal.return_month,"   February 2009\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n\n\n")
  end

  def test_23_month_formatting_01
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

  def test_23_month_formatting_02
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

  def test_23_month_formatting_03
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









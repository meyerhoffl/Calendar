require 'test/unit'
require './lib/calendar'
require './lib/year'
class CalTest < Test::Unit::TestCase

  def test_02_is_leap_year
    cal = Cal.new(2, 2012)
    assert_equal(true, cal.leap_year?)
  end

  def test_03_is_not_leap_year
    cal = Cal.new(2, 2009)
    assert_equal(false, cal.leap_year?)
  end

  def test_04_weekday_of_first_jan
    cal = Cal.new(1, 2013)
    assert_equal(3, cal.weekday_of_first)
  end

  def test_05_weekday_of_first_feb
    cal = Cal.new(2, 2013)
    assert_equal(6, cal.weekday_of_first)
  end

  def test_06_weekday_of_first_rest_of_year
    cal = Cal.new(7, 2013)
    assert_equal(2, cal.weekday_of_first)
  end

  def test_07_5_weeks_in_month
    cal = Cal.new(1, 2013)
    assert_equal(5, cal.weeks_in_month)
  end

  def test_08_6_weeks_in_month
    cal = Cal.new(6, 2013)
    assert_equal(6, cal.weeks_in_month)
  end

  def test_09_4_weeks_in_month
    cal = Cal.new(2, 2009)
    assert_equal(4, cal.weeks_in_month)
  end

  def test_10_get_month_header
    cal = Cal.new(4, 2013)
    assert_equal("April", cal.get_month_header)
  end

  def test_11_format_month_header
    cal = Cal.new(4, 2013)
    assert_equal("     April 2013", cal.format_month_header)
  end

  def test_12_get_week_day_header
    cal = Cal.new(4, 2013)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.get_week_days)
  end

  def test_13_number_of_days_30_days_in_month
    cal = Cal.new(4, 2013)
    assert_equal(30, cal.number_of_days_in_month)
  end

  def test_14_number_of_days_28_days_in_month
    cal = Cal.new(2, 2013)
    assert_equal(28, cal.number_of_days_in_month)
  end

  def test_15_number_of_days_29_days_in_month
    cal = Cal.new(2, 2012)
    assert_equal(29, cal.number_of_days_in_month)
  end

  def test_16_number_of_days_31_days_in_month
    cal = Cal.new(1, 2013)
    assert_equal(31, cal.number_of_days_in_month)
  end

  def test_17_reorder_week_Sunday_is_1
    cal = Cal.new(12, 2013)
    assert_equal(1, cal.reorder_week)
  end

  def test_18_reorder_week_Saturday_is_7
    cal = Cal.new(6, 2013)
    assert_equal(7, cal.reorder_week)
  end

  def test_19_return_month_days_order_1st_on_Sunday
    cal = Cal.new(1, 2012)
    assert_equal(
[["    January 2012"],
 ["Su Mo Tu We Th Fr Sa"],
 [" 1  2  3  4  5  6  7"],
 [" 8  9 10 11 12 13 14"],
 ["15 16 17 18 19 20 21"],
 ["22 23 24 25 26 27 28"],
 ["29 30 31            "],
 ["                    "]], cal.return_days_in_month)
  end

  def test_20_return_month_days_order_1st_on_Saturday
    cal = Cal.new(10, 2011)
    assert_equal([["    October 2011"],
 ["Su Mo Tu We Th Fr Sa"],
 ["                   1"],
 [" 2  3  4  5  6  7  8"],
 [" 9 10 11 12 13 14 15"],
 ["16 17 18 19 20 21 22"],
 ["23 24 25 26 27 28 29"],
 ["30 31               "]], cal.return_days_in_month)
  end

  def test_21_return_month_days_order_1st_in_middle_of_week
    cal = Cal.new(8, 1917)
    assert_equal([["    August 1917"],
 ["Su Mo Tu We Th Fr Sa"],
 ["          1  2  3  4"],
 [" 5  6  7  8  9 10 11"],
 ["12 13 14 15 16 17 18"],
 ["19 20 21 22 23 24 25"],
 ["26 27 28 29 30 31   "],
 ["                    "]], cal.return_days_in_month)
  end

  def test_22_return_month_days_order_leap_year
    cal = Cal.new(2, 2012)
    assert_equal([["   February 2012"],
 ["Su Mo Tu We Th Fr Sa"],
 ["          1  2  3  4"],
 [" 5  6  7  8  9 10 11"],
 ["12 13 14 15 16 17 18"],
 ["19 20 21 22 23 24 25"],
 ["26 27 28 29         "],
 ["                    "]], cal.return_days_in_month)
  end

  def test_23_return_month_days_order_not_leap_year
    cal = Cal.new(2, 2012)
    assert_equal([["   February 2012"],
 ["Su Mo Tu We Th Fr Sa"],
 ["          1  2  3  4"],
 [" 5  6  7  8  9 10 11"],
 ["12 13 14 15 16 17 18"],
 ["19 20 21 22 23 24 25"],
 ["26 27 28 29         "],
 ["                    "]], cal.return_days_in_month)
  end

  def test_24_return_month_days_31_days

    cal = Cal.new(8, 3000)
    assert_equal([["    August 3000"],
 ["Su Mo Tu We Th Fr Sa"],
 ["                1  2"],
 [" 3  4  5  6  7  8  9"],
 ["10 11 12 13 14 15 16"],
 ["17 18 19 20 21 22 23"],
 ["24 25 26 27 28 29 30"],
 ["31                  "]], cal.return_days_in_month)
  end

  def test_25_insert_month_line_breaks
    cal = Cal.new(10, 2014)
    assert_equal([["    October 2014", "\n"],
 ["Su Mo Tu We Th Fr Sa", "\n"],
 ["          1  2  3  4", "\n"],
 [" 5  6  7  8  9 10 11", "\n"],
 ["12 13 14 15 16 17 18", "\n"],
 ["19 20 21 22 23 24 25", "\n"],
 ["26 27 28 29 30 31   ", "\n"],
 ["                    ", "\n"]], cal.insert_month_line_breaks)
  end

  def test_26_return_year_header
    year = Year.new(2013)
    assert_equal("                             2013\n\n", year.return_year_header)
  end

  def test_27_return_year_month_header
    year = Year.new(2013)
    assert_equal(["      January               February               March\n",
 "       April                  May                   June\n",
 "        July                 August              September\n",
 "      October               November              December\n"],year.return_year_month_header)
  end

  def test_28_return_year_days_of_week
    year = Year.new(2013)
    assert_equal("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n", year.return_year_days_of_week)
  end


  def test_29_return_year_day_array
    year = Year.new(2013)
    assert_equal([[["    January 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["       1  2  3  4  5"],
  [" 6  7  8  9 10 11 12"],
  ["13 14 15 16 17 18 19"],
  ["20 21 22 23 24 25 26"],
  ["27 28 29 30 31      "],
  ["                    "]],
 [["   February 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["                1  2"],
  [" 3  4  5  6  7  8  9"],
  ["10 11 12 13 14 15 16"],
  ["17 18 19 20 21 22 23"],
  ["24 25 26 27 28      "],
  ["                    "]],
 [["     March 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["                1  2"],
  [" 3  4  5  6  7  8  9"],
  ["10 11 12 13 14 15 16"],
  ["17 18 19 20 21 22 23"],
  ["24 25 26 27 28 29 30"],
  ["31                  "]],
 [["     April 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["    1  2  3  4  5  6"],
  [" 7  8  9 10 11 12 13"],
  ["14 15 16 17 18 19 20"],
  ["21 22 23 24 25 26 27"],
  ["28 29 30            "],
  ["                    "]],
 [["      May 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["          1  2  3  4"],
  [" 5  6  7  8  9 10 11"],
  ["12 13 14 15 16 17 18"],
  ["19 20 21 22 23 24 25"],
  ["26 27 28 29 30 31   "],
  ["                    "]],
 [["     June 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["                   1"],
  [" 2  3  4  5  6  7  8"],
  [" 9 10 11 12 13 14 15"],
  ["16 17 18 19 20 21 22"],
  ["23 24 25 26 27 28 29"],
  ["30                  "]],
 [["     July 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["    1  2  3  4  5  6"],
  [" 7  8  9 10 11 12 13"],
  ["14 15 16 17 18 19 20"],
  ["21 22 23 24 25 26 27"],
  ["28 29 30 31         "],
  ["                    "]],
 [["    August 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["             1  2  3"],
  [" 4  5  6  7  8  9 10"],
  ["11 12 13 14 15 16 17"],
  ["18 19 20 21 22 23 24"],
  ["25 26 27 28 29 30 31"],
  ["                    "]],
 [["   September 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  [" 1  2  3  4  5  6  7"],
  [" 8  9 10 11 12 13 14"],
  ["15 16 17 18 19 20 21"],
  ["22 23 24 25 26 27 28"],
  ["29 30               "],
  ["                    "]],
 [["    October 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["       1  2  3  4  5"],
  [" 6  7  8  9 10 11 12"],
  ["13 14 15 16 17 18 19"],
  ["20 21 22 23 24 25 26"],
  ["27 28 29 30 31      "],
  ["                    "]],
 [["   November 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  ["                1  2"],
  [" 3  4  5  6  7  8  9"],
  ["10 11 12 13 14 15 16"],
  ["17 18 19 20 21 22 23"],
  ["24 25 26 27 28 29 30"],
  ["                    "]],
 [["   December 2013"],
  ["Su Mo Tu We Th Fr Sa"],
  [" 1  2  3  4  5  6  7"],
  [" 8  9 10 11 12 13 14"],
  ["15 16 17 18 19 20 21"],
  ["22 23 24 25 26 27 28"],
  ["29 30 31            "],
  ["                    "]]], year.return_year_days)
  end
end

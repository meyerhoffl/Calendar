
require "./initiate"

class CalIntegrationTest < Test::Unit::TestCase


  def test_01_initiate_file
    assert_equal(`cal 2 2013`, `ruby ./initiate.rb 2 2013`)
  end

  def test_30_single_month_28_days
    cal = Cal.new(1, 2011)
    assert_equal(`cal 1 2011`, cal.format_month)
  end

  def test_31_single_month_leap_year
    cal = Cal.new(2, 2012)
    assert_equal(`cal 2 2012`, cal.format_month)
  end

  def test_32_single_month_30_days
    cal = Cal.new(9, 1835)
    assert_equal(`cal 9 1835`, cal.format_month)
  end

  def test_33_single_month_31_days
    cal = Cal.new(12, 2089)
    assert_equal(`cal 12 2089`, cal.format_month)
  end

  def test_34_single_month_1st_on_Sunday
    cal = Cal.new(5, 2011)
    assert_equal(`cal 5 2011`, cal.format_month)
  end

  def test_35_single_month_1st_on_Saturday
    cal = Cal.new(10, 2011)
    assert_equal(`cal 10 2011`, cal.format_month)
  end

  def test_36_single_month_1st_on_Saturday
    cal = Cal.new(2, 2009)
    assert_equal(`cal 2 2009`, cal.format_month)
  end

  def test_37_return_year
    year = Year.new(2013)
    assert_equal(`cal 2013`, year.format_year)
  end

  def test_38_return_leap_year
    year = Year.new(1904)
    assert_equal(`cal 1904`, year.format_year)
  end

  def test_39_return_year_1800
    year = Year.new(1800)
    assert_equal(`cal 1800`, year.format_year)
  end

  def test_40_return_year_3000
    year = Year.new(3000)
    assert_equal(`cal 3000`, year.format_year)
  end
end




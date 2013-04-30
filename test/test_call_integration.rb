
require "./lib/initiate"

class CalIntegrationTest < Test::Unit::TestCase


  def test_01
    assert_equal(`cal 2 2013`, `ruby ./lib/initiate.rb 2 2013`)
  end


end



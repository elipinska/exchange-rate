require "test_helper"

class ExchangeRateTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ExchangeRate::VERSION
  end

end

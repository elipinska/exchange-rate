require "test_helper"
require "bigdecimal"

class ExchangeRateTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ExchangeRate::VERSION
  end

#Time-sensitive tests based on data as of 21st June 2018
#   def test_exchange_rate_at
#     assert_equal(BigDecimal("0.814859611231101511879049676e1"), ExchangeRate::FxCalculator.rate_at_date("2018-06-16", "CHF", "NOK"))
#   end
#
# # The test below uses today's data - will not pass before ECB's data is updated (around 4pm on a working day)
#   def test_exchange_rate_at__no_date_given
#     assert_equal(BigDecimal("0.13303619606742785607908311929e2"), ExchangeRate::FxCalculator.rate_at_date("MYR", "PHP"))
#   end

  # See fx_calculator_test and xml_parser_test for more detailed tests on other ExchangeRate methods
end

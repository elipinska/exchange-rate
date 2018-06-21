require "test_helper"
require "bigdecimal"

class FxCalculatorTest < Minitest::Test
  def test_can_calculate_exchange_rate__query_with_date
    assert_equal(BigDecimal("0.4950898477738354126e1"), ExchangeRate::FxCalculator.rate_at_date("2018-06-21", "GBP", "PLN"))
  end

  def test_can_calculate_exchange_rate__query_without_date
    assert_equal(BigDecimal("0.1460045068469405442884382042e1"), ExchangeRate::FxCalculator.rate_at_date("USD", "NZD"))
  end


end

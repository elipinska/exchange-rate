require "test_helper"
require "bigdecimal"

class FxCalculatorTest < Minitest::Test
  def test_can_calculate_exchange_rate__query_with_date
    assert_equal(BigDecimal("0.4950898477738354126e1"), ExchangeRate::FxCalculator.rate_at_date("2018-06-21", "GBP", "PLN"))
  end

  def test_can_calculate_exchange_rate__query_without_date
    assert_equal(BigDecimal("0.1460045068469405442884382042e1"), ExchangeRate::FxCalculator.rate_at_date("USD", "NZD"))
  end

  def test_rate_at_date__raises_currency_not_found_error_base_curr
    assert_raises(ExchangeRate::NotFoundError) do
      ExchangeRate::FxCalculator.rate_at_date("JHK", "NZD")
    end
  end

  def test_rate_at_date__raises_currency_not_found_error_counter_curr
    assert_raises(ExchangeRate::NotFoundError) do
      ExchangeRate::FxCalculator.rate_at_date("NZD", "ZXY")
    end
  end

  def test_rate_at_date__raises_currency_not_found_error_invalid_curr
    assert_raises(ExchangeRate::NotFoundError) do
      ExchangeRate::FxCalculator.rate_at_date(422, "ZXY")
    end
    assert_raises(ExchangeRate::NotFoundError) do
      ExchangeRate::FxCalculator.rate_at_date("2018-06-14", :test, 422)
    end
  end

  def test_valid_date__returns_true
    assert_equal(true, ExchangeRate::FxCalculator.is_valid("2018-06-13"))
  end

  def test_valid_date__returns_false
    assert_equal(false, ExchangeRate::FxCalculator.is_valid("fjnajsn"))
  end

  def test_rate_at_date__raises_invalid_date_error
    assert_raises(ExchangeRate::InvalidDateError) do
      ExchangeRate::FxCalculator.rate_at_date(:hello, 422, "ZXY")
    end
    assert_raises(ExchangeRate::InvalidDateError) do
      ExchangeRate::FxCalculator.rate_at_date(3245, 422, "ZXY")
    end
  end

  def test_rate_at_date__future_date
    assert_raises(ExchangeRate::NotFoundError) do
      ExchangeRate::FxCalculator.rate_at_date("2018-12-24", 422, "ZXY")
    end
  end

  def test_rate_at_date__weekend_date
    friday_rate = ExchangeRate::FxCalculator.rate_at_date("2018-06-15", "CHF", "NOK")
    assert_equal(friday_rate, ExchangeRate::FxCalculator.rate_at_date("2018-06-16", "CHF", "NOK"))
    assert_equal(friday_rate, ExchangeRate::FxCalculator.rate_at_date("2018-06-17", "CHF", "NOK"))
  end


end

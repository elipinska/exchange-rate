require "test_helper"

class ErrorTest < Minitest::Test
  def test_not_found_error_can_be_initialized__for_currency
    assert_equal("GBP not found in ECB's FX data", ExchangeRate::NotFoundError.new('GBP').message)
  end

  def test_not_found_error_can_be_initialized__for_date
    assert_equal("2016-03-14 not found in ECB's FX data", ExchangeRate::NotFoundError.new('2016-03-14').message)
  end

  def test_empty_fx_data_hash_error_can_be_initialized
    assert_equal("FX data hash parsed from the XML source is empty", ExchangeRate::EmptyFxDataHashError.new.message)
  end

  def test_invalid_date_error_can_be_initialized
    assert_equal("Invalid argument passed as date", ExchangeRate::InvalidDateError.new.message)
  end


end

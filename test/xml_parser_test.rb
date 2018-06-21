require "test_helper"

class XMLParserTest < Minitest::Test
  def test_can_fetch_and_save_fx_data
    # Checking the length of the 90-day data hash
    assert_equal(61, ExchangeRate::XMLParser.instance.fetch_and_save_fx_data.length)
    assert_equal(61, ExchangeRate::FxDataCache.instance.read('fx_data').length)

    # Checking the length of the hash for a single date
    assert_equal(33, ExchangeRate::XMLParser.instance.fetch_and_save_fx_data['2018-06-21'].length)
  end


end

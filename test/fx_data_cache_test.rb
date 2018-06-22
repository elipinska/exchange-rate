require "test_helper"

class FxDataCacheTest < Minitest::Test
  # Commented out as these tests create a local store file
  # def test_can_write_to_file
  #   ExchangeRate::FxDataCache.instance.write(:test, "This is a test")
  #   assert_equal("This is a test", ExchangeRate::FxDataCache.instance.read(:test))
  # end
  #
  # def test_can_delete_from_file
  #   ExchangeRate::FxDataCache.instance.write(:test, "This is a test")
  #   ExchangeRate::FxDataCache.instance.delete(:test)
  #   assert_nil(ExchangeRate::FxDataCache.instance.read(:test))
  # end

end

require "exchange_rate/version"
require "exchange_rate/xml_parser"
require "exchange_rate/data_cache"
require "exchange_rate/error"
require "exchange_rate/fx_calculator"

module ExchangeRate

  def ExchangeRate.at(date = Date.today, base_curr, counter_curr)
    return FxCalculator.rate_at_date(date, base_curr, counter_curr)
  end

  def ExchangeRate.fetch_rates
    XMLParser.instance.fetch_and_save_fx_data
  end

  def ExchangeRate.set_data_source(new_endpoint, new_namespace = nil)
    XMLParser.instance.set_data_source(new_endpoint, new_namespace)
  end


end

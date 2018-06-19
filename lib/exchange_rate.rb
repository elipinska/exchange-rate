require "exchange_rate/version"
require "exchange_rate/xml_parser"
require "exchange_rate/data_cache"
require "exchange_rate/error"
require "bigdecimal"

module ExchangeRate

  def ExchangeRate.at(date, base_curr, counter_curr)
    fx_data = DataCache.instance.read("fx_data") ? DataCache.instance.read("fx_data") : XMLParser.instance.fetch_and_save_fx_data
    date_string = date.to_s

    if !fx_data[date_string]
      raise NotFoundError.new(date_string)
    else
      [base_curr, counter_curr].each do |curr|
        raise NotFoundError.new(curr) if !fx_data[date_string][curr]
      end
    end

    exchange_rate = BigDecimal(fx_data[date_string][counter_curr]) / BigDecimal(fx_data[date_string][base_curr])
    return exchange_rate
  end

  def ExchangeRate.fetch_rates
    XMLParser.instance.fetch_and_save_fx_data
    return "FX data updated"
  end


end

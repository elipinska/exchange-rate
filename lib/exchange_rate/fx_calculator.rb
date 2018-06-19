require "bigdecimal"

module ExchangeRate

  class FxCalculator

    def self.rate_at_date(date, base_curr, counter_curr)
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

  end

end

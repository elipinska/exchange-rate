require "bigdecimal"

module ExchangeRate

  class FxCalculator

    def self.rate_at_date(date = Date.today, base_curr, counter_curr)
      if date.is_a?(Date) || is_valid(date)

        fx_data = FxDataCache.instance.read(:fx_data) ? FxDataCache.instance.read(:fx_data) : XMLParser.instance.fetch_and_save_fx_data

        date_string = date.to_s

        if !fx_data[date_string]
          raise NotFoundError.new(date_string)
        else
          [base_curr, counter_curr].each do |curr|
            raise NotFoundError.new(curr) if !fx_data[date_string][curr] || !fx_data[date_string][curr.upcase]
          end
        end

        exchange_rate = BigDecimal(fx_data[date_string][counter_curr.upcase]) / BigDecimal(fx_data[date_string][base_curr.upcase])
        return exchange_rate
      else
        raise InvalidDateError.new
      end
    end

    def self.is_valid(date)
      Date.parse(date.to_s)
      return true
    rescue ArgumentError
      return false
    end

  end

end

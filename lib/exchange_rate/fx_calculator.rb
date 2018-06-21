require "bigdecimal"

module ExchangeRate

  class FxCalculator

    def self.rate_at_date(date = Date.today, base_curr, counter_curr)

      # Check if date is valid
      if date.is_a?(Date) || is_valid?(date)

        # Read data from cache or fetch it from the source
        fx_data = FxDataCache.instance.read(:fx_data) ? FxDataCache.instance.read(:fx_data) : XMLParser.instance.fetch_and_save_fx_data

        date_string = date.to_s

        # Handle dates not in the data hash
        if !fx_data[date_string]

          # If the date is within range, check for the rate at the nearest past date
          if is_within_range?(date_string)
            day_before = Date.parse(date_string).prev_day
            return rate_at_date(day_before, base_curr, counter_curr)
          else
            raise NotFoundError.new(date_string)
          end

        else

          # Check if currencies are valid
          [base_curr, counter_curr].each do |curr|
            raise NotFoundError.new(curr) if !fx_data[date_string][curr] || !fx_data[date_string][curr.upcase]
          end
        end

        # Calculate exchange rate
        exchange_rate = BigDecimal(fx_data[date_string][counter_curr.upcase]) / BigDecimal(fx_data[date_string][base_curr.upcase])
        return exchange_rate
      else
        raise InvalidDateError.new
      end
    end

    def self.is_valid?(date)
      Date.parse(date.to_s)
      return true
    rescue ArgumentError
      return false
    end

    def self.is_within_range(date)
      min_date = Date.parse(fx_data.keys.min)
      max_date = Date.parse(fx_data.keys.max)

      return Date.parse(date) < max_date && Date.parse(date) > min_date
    end

  end

end

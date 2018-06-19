require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch_rates", "Retrieves data from XML source"

    def fetch_rates
      puts ExchangeRate.fetch_rates
    end


    # desc "at DATE BASE_CURR COUNTER_CURR", "Provides the FX rate between two currencies at specific date"
    #
    # method_option :date, :default => Date.today
    # def at(date, base_curr, counter_curr)
    #   puts ExchangeRate.at(date, base_curr, counter_curr)
    # end

  end
end

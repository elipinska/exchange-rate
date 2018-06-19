require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch_rates", "Retrieves data from XML source"

    def fetch_rates
      puts ExchangeRate.fetch_rates
    end

  end
end

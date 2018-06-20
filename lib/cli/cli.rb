require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch_rates", "Fetches data from XML store"

    def fetch_rates
      ExchangeRate.fetch_rates
    end

    desc "get_store", "Gets all stored data"

    def get_store
      p DataCache.instance.store
    end

  end
end

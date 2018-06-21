require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch", "Fetches data from XML store"

    def fetch
      ExchangeRate.fetch_rates
    end


    desc "fetch_to_yaml", "Set Yaml cache"

    def set_yaml_cache(path)
      FxDataCache.instance.set_yaml_cache(path)
      ExchangeRate.fetch_rates
    end

  end
end

require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch", "Fetches data from XML feed"
    method_option :path, :aliases => "-p"
    def fetch
      FxDataCache.instance.set_store(options[:path]) if options[:path]
      ExchangeRate.fetch_rates
    end

  end
end

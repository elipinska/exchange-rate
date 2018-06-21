require 'thor'
require 'exchange_rate'

module ExchangeRate
  class CLI < Thor

    desc "fetch", "Fetches data from XML feed"

    #As an option, you can pass a custom path to the fx_data.store file
    method_option :path, :aliases => "-p"
    def fetch
      FxDataCache.instance.set_store(options[:path]) if options[:path]
      ExchangeRate.fetch_rates
    end

  end
end

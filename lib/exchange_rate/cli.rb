require 'thor'
require 'exchange_rate'
require 'exchange_rate/xml_parser'

module ExchangeRate
  class CLI < Thor

    desc "fetch", "Retrieves data from XML source"

    def fetch
      puts ExchangeRate::XMLParser.instance.update_fx_data
    end


    desc "at DATE BASE_CURR COUNTER_CURR", "Provides the FX rate between two currencies at specific date"

    method_option :date, :default => Date.today
    def at(date, base_curr, counter_curr)
      puts ExchangeRate.at(date, base_curr, counter_curr)
    end

  end
end

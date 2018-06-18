require "open-uri"
require "nokogiri"

module ExchangeRate
  class XMLParser

    @endpoint = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
    @namespace = "http://www.ecb.int/vocabulary/2002-08-01/eurofxref"

    def self.set_data_source(new_endpoint, new_namespace = nil)
      @endpoint = new_endpoint
      @namespace = new_namespace
    end

    def self.fetch_and_save_fx_data
      all_data = fetch_data
      fx_data_hash = create_fx_data_hash(all_data)
      DataCache.write("fx_data", fx_data_hash)
      return fx_data_hash
    end

    def self.update_fx_data
      fetch_and_save_fx_data

      return "FX data updated"
    end

    private

    def self.fetch_data
      doc = Nokogiri::XML(open(@endpoint))
      return doc
    end

    def self.create_fx_data_hash(data)

      fx_data_hash = Hash.new

      time_cubes = extract_time_cubes(data)

      time_cubes.each do |cube|
        fx_data_hash[cube.at_xpath("@time").value] = create_currencies_and_rates_hash(cube)
      end
      return fx_data_hash
    end

    def self.extract_time_cubes(data)
      if @namespace == nil
        time_cubes = data.xpath("//Cube[@time]")
      else
        time_cubes = data.xpath("//a:Cube[@time]", {"a" => @namespace})
      end
    end

    def self.create_currencies_and_rates_hash(time_cube)
      currencies_and_rates_hash = Hash.new

      currencies_and_rates_hash["EUR"] = "1"
      currencies_and_rates =  time_cube.xpath("child::*")

      currencies_and_rates.each do |currency_and_rate|
        currencies_and_rates_hash[currency_and_rate.at_xpath("@currency").value] = currency_and_rate.at_xpath("@rate").value
      end

      return currencies_and_rates_hash
    end
  end
end

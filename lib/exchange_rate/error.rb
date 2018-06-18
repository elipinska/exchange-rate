module ExchangeRate
  class NotFoundError < StandardError

    def initialize(data_not_found)
      super("#{data_not_found} not found in ECB\'s FX data")
    end

  end

end

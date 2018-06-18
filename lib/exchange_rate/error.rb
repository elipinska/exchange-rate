module ExchangeRate
  class NotFoundError < StandardError

    def initialize(data_not_found)
      super("#{data_not_found} not found in ECB\'s FX data")
    end

  end

  class EmptyFxDataHash < StandardError
    def initialize
      super("WARNING: FX data hash parsed from the XML source is empty. Please check if the formatting adheres to ECB's feed format.")
    end
  end

end

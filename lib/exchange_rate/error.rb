module ExchangeRate
  class NotFoundError < StandardError

    def initialize(data_not_found)
      super("#{data_not_found} not found in ECB\'s FX data")
    end

  end

  class EmptyFxDataHash < StandardError
    def initialize
      super("FX data hash parsed from the XML source is empty. Please check if the XML file's formatting adheres to ECB's feed format.")
    end
  end

end

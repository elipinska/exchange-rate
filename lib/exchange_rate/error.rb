module ExchangeRate
  class NotFoundError < StandardError

    def initialize(data_not_found)
      super("#{data_not_found} not found in ECB\'s FX data")
    end

  end

  class EmptyFxDataHashError < StandardError
    def initialize
      super("FX data hash parsed from the XML source is empty")
    end
  end

  class InvalidDateError < StandardError
    def initialize
      super("Invalid argument passed as date")
    end
  end

end

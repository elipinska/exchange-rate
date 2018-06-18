require "singleton"

module ExchangeRate
  class DataCache
    include Singleton

    def initialize
      @store = {}
    end

    def write(key, value)
      @store[key] = value
    end

    def read(key)
      return @store[key]
    end

    def clear
      @store.clear
    end
  end
end

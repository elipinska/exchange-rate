require "singleton"

module ExchangeRate
  class DefaultCache
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

    def delete(key)
      @store.delete(key)
    end

  end
end

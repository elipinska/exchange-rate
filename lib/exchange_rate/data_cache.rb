module ExchangeRate
  class DataCache

    @store = {}

    def self.write(key, value)
      @store[key] = value
    end

    def self.read(key)
      return @store[key]
    end

    def self.clear
      @store.clear
    end
  end
end

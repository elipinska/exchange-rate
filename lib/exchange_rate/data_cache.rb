require "singleton"
require "yaml/store"

module ExchangeRate
  class DataCache
    include Singleton

    def initialize
      @store = YAML::Store.new("/Users/macbook/Documents/Coding/Ruby programmes/exchange_rate/exchange_rate/fx_data.yml")
    end

    def write(key, value)
      @store.transaction do
        @store[key] = value
      end
    end

    def read(key)
      return @store.transaction { @store[key] }
    end

    def delete(key)
      @store.transaction  do
      @store.delete(key)
      end
    end

  end
end

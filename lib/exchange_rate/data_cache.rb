require "singleton"

module ExchangeRate
  class DataCache
    include Singleton

    attr_reader :store

    def initialize
      @store = DefaultCache.instance
    end

    def set_store(new_store)
      @store = new_store
    end

    def write(key, value)
      @store.write(key, value)
    end

    def read(key)
      return @store.read(key)
    end

    def delete(key)
      @store.delete(key)
    end

  end
end

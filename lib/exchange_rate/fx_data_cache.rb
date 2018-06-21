require "singleton"

module ExchangeRate
  class FxDataCache
    include Singleton

    attr_reader :store

    def initialize
      @store = DefaultCache.instance
    end

    def set_yaml_cache(file_path = "#{Dir.pwd}/fx_data")
      @store = YamlCache.new(file_path)
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

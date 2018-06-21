require "singleton"
require 'yaml/store'

module ExchangeRate
  class FxDataCache
    include Singleton

    def initialize
      @store = YAML::Store.new("#{Dir.pwd}/fx_data")
    end

    def set_yaml_cache(file_path)
      new_store = YAML::Store.new("#{file_path}/fx_data")
      @store = new_store
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
      @store.transaction do
        @store.delete(key)
      end
    end

  end
end

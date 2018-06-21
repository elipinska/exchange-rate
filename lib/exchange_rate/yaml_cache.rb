require 'yaml/store'

module ExchangeRate
  class YamlCache

    def initialize(file_path = "#{Dir.pwd}/fx_data")
      @store = YAML::Store.new(file_path)
    end

    def set_store(new_store)
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

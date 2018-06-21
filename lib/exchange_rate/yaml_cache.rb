require 'yaml/store'

module ExchangeRate
  class YamlCache

    TMP_FILE = "/tmp/fx_data.store"

    def initialize(file_path)
      @store = YAML::Store.new("#{file_path}/fx_data")
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

require "rest-client"

module MarlinActions
  class Base
    MASTER_URL = "https://marlin-storage.herokuapp.com/".freeze
    API_URL = MASTER_URL + "keys/".freeze
    REPLICA_URL = "https://marlin-storage-slave.herokuapp.com/keys/".freeze

    attr_reader :key

    def initialize(key = nil)
      @key = key
    end

    def key_route
      API_URL + key.to_s
    end

    def replica_or_master_route
      [API_URL, REPLICA_URL].sample + key.to_s
    end

    def flush_route
      [MASTER_URL, "flushall"].join
    end
  end
end

require "rest-client"

module MarlinActions
  class Base
    API_URL = "https://marlin-storage.herokuapp.com/keys/".freeze

    def initialize(key)
      @key = key
    end

    def key_route
      API_URL + @key.to_s
    end
  end
end

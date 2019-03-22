module MarlinActions
  class Put < Base
    def perform(value)
      RestClient.put(key_route, value.to_json).body
    rescue StandardError
      false
    end
  end
end

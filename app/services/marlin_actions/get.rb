module MarlinActions
  class Get < Base
    def perform
      JSON.parse(RestClient.get(key_route).body)
    rescue StandardError
      false
    end
  end
end

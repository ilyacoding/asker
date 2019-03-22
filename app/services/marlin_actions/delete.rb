module MarlinActions
  class Delete < Base
    def perform
      RestClient.delete(key_route).body
    rescue StandardError
      false
    end
  end
end

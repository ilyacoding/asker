module MarlinActions
  class Flush < Base
    def perform
      RestClient.get(flush_route).body
    rescue StandardError
      false
    end
  end
end

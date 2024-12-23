module MarlinActions
  class Get < Base
    def perform
      JSON.parse(RestClient.get(replica_or_master_route).body)
    rescue StandardError
      false
    end
  end
end

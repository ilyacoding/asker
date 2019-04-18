module MarlinActions
  class Ping < Base
    def perform
      ALL_REPLICAS.each do |replica_url|
        JSON.parse(RestClient.get(ping_route(replica_url)).body)
      end
    rescue StandardError
      false
    end
  end
end

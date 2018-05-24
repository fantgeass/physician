module Requests
  module Helpers
    def json_body
      JSON.parse(response.body, symbolize_names: true)
    end

    def json_headers
      {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    end
  end
end

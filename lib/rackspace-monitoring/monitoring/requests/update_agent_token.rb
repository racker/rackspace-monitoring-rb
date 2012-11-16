module Fog
  module Monitoring
    class Rackspace
      class Real

        def update_agent_token(id, options = {})
          data = options.dup
          request(
            :body     => JSON.encode(data),
            :expects  => [204],
            :method   => 'PUT',
            :path     => "agent_token/#{id}"
          )
        end
      end
    end
  end
end


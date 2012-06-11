module Fog
  module Monitoring
    class Rackspace
      class Real

        def create_agent_token(options = {})
          data = options.dup
          request(
            :body     => MultiJson.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => 'agent_tokens'
          )
        end
      end
    end
  end
end


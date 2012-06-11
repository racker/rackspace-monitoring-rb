module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_agent_tokens
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => "agent_tokens"
          )
        end

      end
    end
  end
end


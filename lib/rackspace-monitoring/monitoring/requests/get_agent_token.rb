module Fog
  module Monitoring
    class Rackspace
      class Real

        def get_agent_token(id)
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => "agent_tokens/#{id}"
          )
        end

      end
    end
  end
end



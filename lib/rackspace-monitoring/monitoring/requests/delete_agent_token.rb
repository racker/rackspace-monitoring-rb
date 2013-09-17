module Fog
  module Monitoring
    class Rackspace
      class Real

        def delete_agent_token(token_id)
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "agent_tokens/#{token_id}"
          )
        end
      end
    end
  end
end

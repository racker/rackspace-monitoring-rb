module Fog
  module Monitoring
    class Rackspace
      class Real

        def create_alarm(entity_id, options = {})
          data = options.dup
          request(
            :body     => JSON.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => "entities/#{entity_id}/alarms"
          )
        end
      end
    end
  end
end


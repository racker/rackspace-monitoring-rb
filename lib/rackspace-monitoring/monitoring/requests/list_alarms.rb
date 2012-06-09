module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_alarms(entity_id)
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => "entities/#{entity_id}/alarms"
          )
        end

      end
    end
  end
end


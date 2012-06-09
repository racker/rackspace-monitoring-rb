module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_checks(entity_id)
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => "entities/#{entity_id}/checks"
          )
        end

      end
    end
  end
end


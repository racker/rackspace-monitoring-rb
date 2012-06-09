module Fog
  module Monitoring
    class Rackspace
      class Real

        def get_entity(entity_id)
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => "entities/#{entity_id}"
          )
        end

      end
    end
  end
end



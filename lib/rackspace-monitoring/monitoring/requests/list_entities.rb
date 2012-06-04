module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_entities
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => 'entities'
          )
        end

      end

      class Mock

      end
    end
  end
end


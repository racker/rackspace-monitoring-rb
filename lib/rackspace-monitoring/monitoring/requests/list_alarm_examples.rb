module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_overview
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => 'list_alarm_examples'
          )
        end

      end
    end
  end
end


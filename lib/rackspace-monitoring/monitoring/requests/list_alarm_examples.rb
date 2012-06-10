module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_alarm_examples
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => 'alarm_examples'
          )
        end

      end
    end
  end
end


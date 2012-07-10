module Fog
  module Monitoring
    class Rackspace
      class Real

        def evaluate_alarm_example(id, options = {})
          options ||= {}
          data = {:values => options.dup}
          request(
            :body     => JSON.encode(data),
            :expects  => [200],
            :method   => 'POST',
            :path     => "alarm_examples/#{id}"
          )
        end
      end
    end
  end
end



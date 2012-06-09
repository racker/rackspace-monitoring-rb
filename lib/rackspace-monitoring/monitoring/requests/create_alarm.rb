module Fog
  module Monitoring
    class Rackspace
      class Real


        def create_alarm(entity_id, notification_plan_id, options = {})
          options['notification_plan_id'] = notification_plan_id
          request(
            :body     => MultiJson.encode(options),
            :expects  => [201],
            :method   => 'POST',
            :path     => "entities/#{entity_id}/alarms"
          )
        end
      end
    end
  end
end


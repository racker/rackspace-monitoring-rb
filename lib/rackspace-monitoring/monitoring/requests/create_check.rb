module Fog
  module Monitoring
    class Rackspace
      class Real

        # 
        #    'label'       => label,
        #    'metadata'    => metadata,
        #    'target_alias'=> target_alias,
        #    'target_resolver' => target_resolver,
        #    'target_hostname' => target_hostname,
        #    'period' => period,
        #    'timeout'=> timeout,
        #    'details'=> details,
        #    'monitoring_zones_poll'=> monitoring_zones_poll,
        #    'disabled'=> disabled

        def create_check(entity_id, type, options = {})
          options['type'] = type
          request(
            :body     => MultiJson.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => "entities/#{entity_id}/checks"
          )
        end
      end
    end
  end
end


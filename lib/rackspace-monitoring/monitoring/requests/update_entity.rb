module Fog
  module Monitoring
    class Rackspace
      class Real

        def update_entity(entity_id, options = {})
          data = {}
          data['label'] = options['label']
          data['metadata'] = options['metadata']
          data['ip_addresses'] = options['ip_addresses']
          request(
            :body     => MultiJson.encode(data),
            :expects  => [204],
            :method   => 'PUT',
            :path     => "entities/#{entity_id}"
          )
        end
      end
    end
  end
end


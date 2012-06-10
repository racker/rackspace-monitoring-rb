module Fog
  module Monitoring
    class Rackspace
      class Real

        def create_entity(options = {})
          data = {}
          data['label'] = options['label']
          data['metadata'] = options['metadata']
          data['ip_addresses'] = options['ip_addresses']
          request(
            :body     => MultiJson.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => 'entities'
          )
        end
      end
    end
  end
end


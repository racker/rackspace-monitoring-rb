module Fog
  module Monitoring
    class Rackspace
      class Real

        def create_entity(options = {})
          data = options.dup
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


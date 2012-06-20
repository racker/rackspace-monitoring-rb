module Fog
  module Monitoring
    class Rackspace
      class Real

        def update_entity(id, options)
          request(
            :body     => JSON.generate(options),
            :expects  => [204],
            :method   => 'PUT',
            :path     => "entities/#{id}"
          )
        end
      end
    end
  end
end


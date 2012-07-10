module Fog
  module Monitoring
    class Rackspace
      class Real

        def update_check(entity_id, id, options)
          request(
            :body     => JSON.encode(options),
            :expects  => [204],
            :method   => 'PUT',
            :path     => "entities/#{entity_id}/checks/#{id}"
          )
        end
      end
    end
  end
end


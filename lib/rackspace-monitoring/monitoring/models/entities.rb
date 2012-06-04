require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/entity'

module Fog
  module Monitoring
    class Rackspace
      class Entities < Fog::Collection

        model Fog::Monitoring::Rackspace::Entity

        def all
          data = connection.list_entities.body['entities']
          load(data)
        end

        def get(entity_id)
          data = connection.get_entity(entity_id).body['entity']
          new(data)

        rescue Fog::Monitoring::Rackspace::NotFound
          nil
        end

      end
    end
  end
end

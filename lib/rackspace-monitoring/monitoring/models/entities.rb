require 'rackspace-fog/core/collection'
require 'rackspace-monitoring/monitoring/models/entity'
require 'rackspace-monitoring/monitoring/models/check'

module Fog
  module Monitoring
    class Rackspace
      class Entities < Fog::Collection

        model Fog::Monitoring::Rackspace::Entity

        def all
          data = connection.list_entities.body['values']
          load(data)
        end

        def get(entity_id)
          data = connection.get_entity(entity_id).body
          new(data)
        rescue Fog::Monitoring::Rackspace::NotFound
          nil
        end

        def overview
          data = connection.list_overview.body['values']
          loadAll(data)
        end

        def loadAll(objects)
          clear
          for object in objects
            en = new(object['entity'])
            self << en
            en.checks.load(object['checks'])
            en.alarms.load(object['alarms'])
          end
          self
        end
      end
    end
  end
end

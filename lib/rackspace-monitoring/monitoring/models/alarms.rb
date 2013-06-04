require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/alarm'

module Fog
  module Monitoring
    class Rackspace
      class Alarms < Fog::Collection

        attribute :entity

        model Fog::Monitoring::Rackspace::Alarm

        def all
          requires :entity
          data = connection.list_alarms(entity.identity).body['values']
          load(data)
        end

        def get(alarm_id)
          requires :entity
          data = connection.get_alarm(entity.identity, alarm_id).body
          new(data)
        rescue Fog::Monitoring::Rackspace::NotFound
          nil
        end

        def new(attributes = {})
          requires :entity
          super({ :entity => entity }.merge!(attributes))
        end

        def create(attributes = {})
          requires :entity
          super({ :entity => entity }.merge!(attributes))
        end

      end
    end
  end
end

require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/check'

module Fog
  module Monitoring
    class Rackspace
      class Checks < Fog::Collection

        attribute :entity

        model Fog::Monitoring::Rackspace::Check

        def all
          requires :entity
          data = connection.list_checks(entity.identity).body['values']
          load(data)
        end

        def get(check_id)
          requires :entity
          data = connection.get_check(entity.identity, check_id).body
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

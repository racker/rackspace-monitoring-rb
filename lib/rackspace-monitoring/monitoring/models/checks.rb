require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/check'

module Fog
  module Monitoring
    class Rackspace
      class Checks < Fog::Collection

        model Fog::Monitoring::Rackspace::Check

        def all(entity_id)
          data = connection.list_checks(entity_id).body['values']
          load(data)
        end

        def get(entity_id, check_id)
          data = connection.get_check(entity_id, check_id).body
          new(data)
        rescue Fog::Monitoring::Rackspace::NotFound
          nil
        end

      end
    end
  end
end

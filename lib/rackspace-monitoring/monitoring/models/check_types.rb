require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/check_type'

module Fog
  module Monitoring
    class Rackspace
      class CheckTypes < Fog::Collection

        model Fog::Monitoring::Rackspace::CheckType

        def all
          data = connection.list_check_types.body['values']
          load(data)
        end

        def new(attributes = {})
          super({ }.merge!(attributes))
        end

      end
    end
  end
end

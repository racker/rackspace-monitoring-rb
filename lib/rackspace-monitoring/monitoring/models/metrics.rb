require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/metric'

module Fog
  module Monitoring
    class Rackspace
      class Metrics < Fog::Collection

        attribute :check

        model Fog::Monitoring::Rackspace::Metric

        def all
          requires :check
          data = connection.list_metrics(check.entity.id, check.id).body['values']
          load(data)
        end

        def new(attributes = {})
          requires :check
          super({ :check => check }.merge!(attributes))
        end

      end
    end
  end
end

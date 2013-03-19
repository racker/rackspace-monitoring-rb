require 'rackspace-fog/core/collection'
require 'rackspace-monitoring/monitoring/models/data_point'

module Fog
  module Monitoring
    class Rackspace
      class DataPoints < Fog::Collection

        attribute :metric

        model Fog::Monitoring::Rackspace::DataPoint

        def all
          self.fetch(:resolution => "FULL")
        end

        def fetch(options={})
          requires :metric
          options[:from] ||= (Time.now.to_i * 1000) - (3600 * 1000)
          options[:to] ||= Time.now.to_i * 1000
          options[:points] ||= 1 unless options[:resolution]
          data = connection.list_data_points(metric.check.entity.id, metric.check.id, metric.name, options).body['values']
          load(data)
        end

        def new(attributes = {})
          requires :metric
          super({ :metric => metric }.merge!(attributes))
        end

      end
    end
  end
end
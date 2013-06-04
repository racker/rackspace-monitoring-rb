require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class DataPoint < Fog::Monitoring::Rackspace::Base
        attribute :num_points, :aliases => "numPoints"
        attribute :average
        attribute :variance
        attribute :min
        attribute :max
        attribute :timestamp
        attribute :metric
      end
    end
  end
end

require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class Metric < Fog::Monitoring::Rackspace::Base

        identity  :name
        attribute :check

        def datapoints(options={})
          @datapoints ||= begin
            Fog::Monitoring::Rackspace::DataPoints.new(
              :metric        => self,
              :connection    => connection
            )
          end
        end

      end

    end
  end
end

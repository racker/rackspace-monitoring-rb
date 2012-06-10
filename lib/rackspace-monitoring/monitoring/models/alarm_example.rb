require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class Alarm < Fog::Monitoring::Rackspace::Base

        identity :id

        attribute :label
        attribute :description
        attribute :check_type
        attribute :criteria
        attribute :fields

      end
    end
  end
end

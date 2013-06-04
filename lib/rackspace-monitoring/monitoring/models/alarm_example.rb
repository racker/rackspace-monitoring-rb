require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class AlarmExample < Fog::Monitoring::Rackspace::Base

        identity :id

        attribute :label
        attribute :description
        attribute :check_type
        attribute :criteria
        attribute :fields


        attribute :bound_criteria

        def bound?
          !bound_criteria.nil?
        end
      end
    end
  end
end

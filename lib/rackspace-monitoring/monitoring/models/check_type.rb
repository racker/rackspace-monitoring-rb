require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class CheckType < Fog::Monitoring::Rackspace::Base
        identity :id
        attribute :type
        attribute :fields
        attribute :channel
      end
    end
  end
end

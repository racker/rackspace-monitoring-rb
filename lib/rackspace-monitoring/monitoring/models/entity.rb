require 'fog/core/model'

module Fog
  module Monitoring
    class Rackspace
      class Entity < Fog::Model

        identity :id

        attribute :label
        attribute :metadata
        attribute :ip_addresses
        attribute :agent_id
      end

    end
  end
end

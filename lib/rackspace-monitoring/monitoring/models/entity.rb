require 'fog/core/model'

module Fog
  module Monitoring
    class Rackspace

      class Entity < Fog::Model

        identity :id

        attribute :label
        attribute :metadata
      end

    end
  end
end

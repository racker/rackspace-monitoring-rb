require 'fog/core/model'

module Fog
  class Rackspace

    class Entity < Fog::Model

      identity :id

      attribute :label
      attribute :metadata
    end

  end
end

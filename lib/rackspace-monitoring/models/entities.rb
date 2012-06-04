require 'fog/core/collection'

module Fog
  module Rackspace

    class Entities < Fog::Collection

      model Fog::Rackspace::Entity

      def all
        data = connection.list_entities.body['entities']
        load(data)
      end

      def get(entity_id)
        data = connection.get_entity(entity_id).body['entity']
        new(data)
      rescue Fog::Rackspace::Monitoring::NotFound
        nil
      end

    end

  end
end

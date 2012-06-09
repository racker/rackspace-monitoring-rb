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

        def save
          raise Fog::Errors::Error.new('Update not implemented yet.') if identity
          requires :label
          options = {
            'metadata'    => metadata,
            'ip_addresses'=> ip_addresses,
            'agent_id'    => agent_id
          }
          options = options.reject {|key, value| value.nil?}
          data = connection.create_entity(label, options)
          true
        end

        def checks
          @checks ||= begin
            Fog::Monitoring::Rackspace::Checks.new(
              :entity     => self,
              :connection => connection
            )
          end
        end

        def alarms
          @alarms ||= begin
            Fog::Monitoring::Rackspace::Alarms.new(
              :entity     => self,
              :connection => connection
            )
          end
        end
      end
    end
  end
end

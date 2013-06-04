require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class Entity < Fog::Monitoring::Rackspace::Base

        identity :id

        attribute :label
        attribute :metadata
        attribute :ip_addresses
        attribute :agent_id
        attribute :managed, :default => false
        attribute :uri

        def prep
          options = {
            'label'       => label,
            'metadata'    => metadata,
            'ip_addresses'=> ip_addresses,
            'agent_id'    => agent_id
          }
          options = options.reject {|key, value| value.nil?}
          options
        end

        def save
          options = prep
          if identity then
            data = connection.update_entity(identity, options)
          else
            data = connection.create_entity(options)
          end
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

        def destroy
          requires :id
          connection.delete_entity(id)
        end

      end
    end
  end
end

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
            data = service.update_entity(identity, options)
          else
            data = service.create_entity(options)
            self.identity = data.data[:headers]['X-Object-ID']
          end
          data = service.get_entity(identity)
          self.label = data.data[:body]['label']
          self.metadata = data.data[:body]['metadata']
          self.ip_addresses = data.data[:body]['ip_addresses']
          self.agent_id = data.data[:body]['agent_id']
          self.managed = data.data[:body]['managed']
          self.uri = data.data[:body]['uri']
          true
        end

        def checks
          @checks ||= begin
            Fog::Monitoring::Rackspace::Checks.new(
              :entity     => self,
              :service => service
            )
          end
        end

        def alarms
          @alarms ||= begin
            Fog::Monitoring::Rackspace::Alarms.new(
              :entity     => self,
              :service => service
            )
          end
        end

        def destroy
          requires :id
          service.delete_entity(id)
        end

      end
    end
  end
end

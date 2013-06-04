require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class Check < Fog::Monitoring::Rackspace::Base

        identity :id
        attribute :entity
        attribute :entity_id

        attribute :label
        attribute :metadata
        attribute :target_alias
        attribute :target_resolver
        attribute :target_hostname
        attribute :period
        attribute :timeout
        attribute :type
        attribute :details
        attribute :disabled
        attribute :monitoring_zones_poll

        def prep
          options = {
            'label'       => label,
            'metadata'    => metadata,
            'target_alias'=> target_alias,
            'target_resolver' => target_resolver,
            'target_hostname' => target_hostname,
            'period' => period,
            'timeout'=> timeout,
            'details'=> details,
            'monitoring_zones_poll'=> monitoring_zones_poll,
            'disabled'=> disabled
          }
          options = options.reject {|key, value| value.nil?}
          options
        end

        def save
          begin
            requires :entity
            entity_id = entity.identity
          rescue
            requires :entity_id
          end
          options = prep
          if identity then
            data = connection.update_check(entity_id, identity, options)
          else
            requires :type
            options['type'] = type
            data = connection.create_check(entity_id, options)
          end
          true
        end

        def metrics
          @metrics ||= begin
            Fog::Monitoring::Rackspace::Metrics.new(
              :check      => self,
              :connection => connection
            )
          end
        end

      end

    end
  end
end

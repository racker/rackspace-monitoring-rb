require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class Check < Fog::Monitoring::Rackspace::Base

        identity :id
        attribute :entity

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

        def save
          raise Fog::Errors::Error.new('Update not implemented yet.') if identity
          requires :type
          requires :entity
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
          data = connection.create_check(entity.identity, type, options)
          true
        end

      end

    end
  end
end
require 'fog/core/model'
require 'rackspace-monitoring/monitoring/models/base'

module Fog
  module Monitoring
    class Rackspace
      class AgentToken < Fog::Monitoring::Rackspace::Base

        identity :id

        attribute :label
        attribute :token

        def prep
          options = {
            'label'                => label,
            'token'                => token
          }
          options = options.reject {|key, value| value.nil?}
          options
        end

        def save
          options = prep
          if identity then
            data = connection.update_agent_token(identity, options)
          else
            data = connection.create_agent_token(options)
          end
          true
        end

      end

    end
  end
end

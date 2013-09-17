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
            data = service.update_agent_token(identity, options)
          else
            data = service.create_agent_token(options)
            self.identity = data.data[:headers]['X-Object-ID']
          end
          data = service.get_agent_token(identity)
          self.token = data.data[:body]['token']
          true
        end

        def destroy
          requires :id
          service.delete_agent_token(id)
        end

      end

    end
  end
end

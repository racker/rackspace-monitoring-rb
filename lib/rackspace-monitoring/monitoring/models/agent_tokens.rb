require 'rackspace-fog/core/collection'
require 'rackspace-monitoring/monitoring/models/agent_token'

module Fog
  module Monitoring
    class Rackspace
      class AgentTokens < Fog::Collection

        model Fog::Monitoring::Rackspace::AgentToken

        def all
          data = connection.list_agent_tokens.body['values']
          load(data)
        end

        def get(id)
          data = connection.get_agent_token(id).body
          new(data)
        rescue Fog::Monitoring::Rackspace::NotFound
          nil
        end

      end
    end
  end
end

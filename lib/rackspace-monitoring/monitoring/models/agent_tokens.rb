require 'fog/core/collection'
require 'rackspace-monitoring/monitoring/models/agent_token'

module Fog
  module Monitoring
    class Rackspace
      class AgentTokens < Fog::Collection

        model Fog::Monitoring::Rackspace::AgentToken

        def all
          data = []
          opts = {}
          begin
            new_tokens = connection.list_agent_tokens(opts)
            data.concat(new_tokens.body['values'])
            opts = {:marker => new_tokens.body['metadata']['next_marker']}
          end until opts[:marker].nil?

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

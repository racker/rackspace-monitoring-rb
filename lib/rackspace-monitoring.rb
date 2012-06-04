require 'fog/core'
require 'fog/rackspace'
require 'multi_json'

module Fog
  module Monitoring
    class Rackspace < Fog::Service

      ENDPOINT = 'https://monitoring.api.rackspacecloud.com/v1.0'

      requires :rackspace_api_key, :rackspace_username
      recognizes :rackspace_auth_url, :persistent
      recognizes :rackspace_auth_token, :rackspace_service_url, :rackspace_account_id

      model_path  'rackspace-monitoring/monitoring/models'
      model       :entity
      collection  :entities

      request_path 'rackspace-monitoring/monitoring/requests'
      request      :list_entities

      # TODO: Fill this out
      class Mock

      end

      class Real
        def initialize(options={})
          @rackspace_api_key = options[:rackspace_api_key]
          @rackspace_username = options[:rackspace_username]
          @rackspace_auth_url = options[:rackspace_auth_url]
          @rackspace_auth_token = options[:rackspace_auth_token]
          @rackspace_account_id = options[:rackspace_account_id]
          @rackspace_service_url = options[:rackspace_service_url] || ENDPOINT
          @rackspace_must_reauthenticate = false
          @connection_options = options[:connection_options] || {}
          authenticate
          @persistent = options[:persistent] || false
          @connection = Fog::Connection.new("#{@scheme}://#{@host}:#{@port}", @persistent, @connection_options)
        end

        def reload
          @connection.reset
        end

        def request(params)
          begin
            response = @connection.request(params.merge({
              :headers  => {
                'Content-Type' => 'application/json',
                'X-Auth-Token' => @auth_token
              }.merge!(params[:headers] || {}),
              :host     => @host,
              :path     => "#{@path}/#{params[:path]}"
            }))
          rescue Excon::Errors::Unauthorized => error
            if error.response.body != 'Bad username or password' # token expiration
              @rackspace_must_reauthenticate = true
              authenticate
              retry
            else # bad credentials
              raise error
            end
          rescue Excon::Errors::HTTPStatusError => error
            raise case error
            when Excon::Errors::NotFound
              Fog::Monitoring::Rackspace::NotFound.slurp(error)
            else
              error
            end
          end
          unless response.body.empty?
            response.body = MultiJson.decode(response.body)
          end
          response
        end

        private

        def authenticate
          if @rackspace_must_reauthenticate || @rackspace_auth_token.nil? || @account_id.nil?
            options = {
              :rackspace_api_key  => @rackspace_api_key,
              :rackspace_username => @rackspace_username,
              :rackspace_auth_url => @rackspace_auth_url
            }
            credentials = Fog::Rackspace.authenticate(options, @connection_options)
            @auth_token = credentials['X-Auth-Token']
            @account_id = credentials['X-Server-Management-Url'].match(/.*\/([\d]+)$/)[1]
          else
            @auth_token = @rackspace_auth_token
            @account_id = @rackspace_account_id
          end
          uri = URI.parse("#{@rackspace_service_url}/#{@account_id}")
          @host   = uri.host
          @path   = uri.path
          @port   = uri.port
          @scheme = uri.scheme
        end

      end
    end
  end
end

require 'fog/core'
require 'fog/rackspace'

module Fog

  module Rackspace

    class Monitoring < Fog::Service

      requires :rackspace_api_key, :rackspace_username
      recognizes :rackspace_auth_url, :rackspace_servicenet, :persistent
      recognizes :rackspace_auth_token, :rackspace_management_url

      model_path 'rackspace-monitoring/monitoring/models'
      model       :entity
      collection  :entities

      request_path 'rackspace-monitoring/monitoring/requests'
      request :list_entities

      # TODO: Fill this out
      class Mock

      end

      class Real
        def initialize(options={})
          @rackspace_api_key = options[:rackspace_api_key]
          @rackspace_username = options[:rackspace_username]
          @rackspace_auth_url = options[:rackspace_auth_url]
          @rackspace_servicenet = options[:rackspace_servicenet]
          @rackspace_auth_token = options[:rackspace_auth_token]
          @rackspace_management_url = options[:rackspace_management_url]
          @rackspace_must_reauthenticate = false
          @connection_options = options[:connection_options] || {}
          authenticate
          Excon.ssl_verify_peer = false if options[:rackspace_servicenet] == true
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
              :path     => "#{@path}/#{params[:path]}",
              :query    => ('ignore_awful_caching' << Time.now.to_i.to_s)
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
              Fog::Compute::Rackspace::NotFound.slurp(error)
            else
              error
            end
          end
          unless response.body.empty?
            response.body = Fog::JSON.decode(response.body)
          end
          response
        end

        private

        def authenticate
          if @rackspace_must_reauthenticate || @rackspace_auth_token.nil?
            options = {
              :rackspace_api_key  => @rackspace_api_key,
              :rackspace_username => @rackspace_username,
              :rackspace_auth_url => @rackspace_auth_url
            }
            credentials = Fog::Rackspace.authenticate(options, @connection_options)
            @auth_token = credentials['X-Auth-Token']
            uri = URI.parse(credentials['X-Server-Management-Url'])
          else
            @auth_token = @rackspace_auth_token
            uri = URI.parse(@rackspace_management_url)
          end
          @host   = @rackspace_servicenet == true ? "snet-#{uri.host}" : uri.host
          @path   = uri.path
          @port   = uri.port
          @scheme = uri.scheme
        end

      end


      class Entity

      end
    end
  end
end

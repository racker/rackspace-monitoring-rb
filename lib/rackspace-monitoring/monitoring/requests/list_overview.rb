module Fog
  module Monitoring
    class Rackspace
      class Real

        def list_overview(opts={})
          path = "views/overview"
          opts.keys.each do |key|
            path = path + "?#{key}=#{opts[key]}"
          end
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => path
          )
        end

      end
    end
  end
end


module Fog
  module Monitoring
    class Rackspace
      class Real

        def create_check(entity_id, type, options = {})
          data = {}
          data['type'] = type
          if options['label'] then
            data['label'] = options['label']
          end
          if options['metadata'] then
            data['metadata'] = options['metadata']
          end
          if options['target_alias'] then
            data['target_alias'] = options['target_alias']
          end
          if options['target_resolver'] then
            data['target_resolver'] = options['target_resolver']
          end
          if options['target_hostname'] then
            data['target_hostname'] = options['target_hostname']
          end
          if options['period'] then
            data['period'] = options['period']
          end
          if options['timeout'] then
            data['timeout'] = options['timeout']
          end
          if options['details'] then
            data['details'] = options['details']
          end
          if options['monitoring_zones_poll'] then
            data['monitoring_zones_poll'] = options['monitoring_zones_poll']
          end
          if options['disabled'] then
            data['disabled'] = options['disabled']
          end
          request(
            :body     => MultiJson.encode(data),
            :expects  => [201],
            :method   => 'POST',
            :path     => "entities/#{entity_id}/checks"
          )
        end
      end
    end
  end
end


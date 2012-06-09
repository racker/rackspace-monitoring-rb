require 'fog/core/model'

module Fog
  module Monitoring
    class Rackspace
      class Alarm < Fog::Model

        identity :id

        attribute :label
        attribute :criteria
        attribute :check_type
        attribute :check_id
        attribute :notification_plan_id

        def save
          raise Fog::Errors::Error.new('Update not implemented yet.') if identity
          requires :notification_plan_id
          options = {
            'label'       => label,
            'criteria'    => criteria,
            'check_type'  => check_type,
            'check_id'    => check_id,
          }
          options = options.reject {|key, value| value.nil?}
          data = connection.create_alarm(entity_id, notification_plan_id, options)
          true
        end

      end

    end
  end
end

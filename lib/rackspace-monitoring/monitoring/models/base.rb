require 'digest/md5'

module Fog
  module Monitoring
    class Rackspace
      module Base

        def hash
          keys = attributes.keys.map{|sym| sym.to_s}.sort.join ''
          values = attributes.values.map{|sym| sym.to_s}.sort.join ''
          Digest::MD5.hexdigest(keys + values)
        end
      end
    end
  end
end

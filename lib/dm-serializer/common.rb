require 'dm-core'

module DataMapper
  module Serializer
    # Returns properties to serialize based on :only or :exclude arrays,
    # if provided :only takes precedence over :exclude
    #
    # @return [Array]
    #   Properties that need to be serialized.
    def properties_to_serialize(options)
      only_properties     = Array(options[:only])
      excluded_properties = Array(options[:exclude])

      model.properties(repository.name).reject do |p|
        if only_properties.include? p.name
          false
        else
          excluded_properties.include?(p.name) ||
            !(only_properties.empty? ||
            only_properties.include?(p.name))
        end
      end
    end
  end

  Model.append_inclusions(Serializer)
end

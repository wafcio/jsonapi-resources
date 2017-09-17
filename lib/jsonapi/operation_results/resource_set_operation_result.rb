module JSONAPI
  class ResourceSetOperationResult < OperationResult
    attr_accessor :resource_set, :pagination_params

    def initialize(code, resource_set, options = {})
      @resource_set = resource_set
      @pagination_params = options.fetch(:pagination_params, {})
      super(code, options)
    end

    def to_hash(serializer)
      if serializer
        serializer.serialize_resource_set_to_hash(resource_set)
      else
        # :nocov:
        {}
        # :nocov:
      end
    end
  end
end

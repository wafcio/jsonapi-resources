module JSONAPI
  class RelatedResourcesSetOperationResult < ResourcesSetOperationResult
    attr_accessor :resource_set, :source_resource, :_type

    def initialize(code, source_resource, type, resource_set, options = {})
      @source_resource = source_resource
      @_type = type
      super(code, resource_set, options)
    end

    def to_hash(serializer = nil)
      if serializer
        serializer.serialize_related_resources_set_to_hash(source_resource, resource_set)
      else
        # :nocov:
        {}
        # :nocov:
      end
    end
  end
end

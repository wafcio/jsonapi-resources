module JSONAPI
  class ResourcesSetOperationResult < OperationResult
    attr_accessor :resource_set, :pagination_params, :record_count, :page_count

    def initialize(code, resource_set, options = {})
      @resource_set = resource_set
      @pagination_params = options.fetch(:pagination_params, {})
      @record_count = options[:record_count]
      @page_count = options[:page_count]
      super(code, options)
    end

    def to_hash(serializer)
      if serializer
        serializer.serialize_resources_set_to_hash(resource_set)
      else
        # :nocov:
        {}
        # :nocov:
      end
    end
  end
end

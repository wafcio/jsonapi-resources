module JSONAPI
  class LinksObjectOperationResult < OperationResult
    attr_accessor :parent_resource, :relationship, :resource_ids

    def initialize(code, parent_resource, relationship, resource_ids, options = {})
      @parent_resource = parent_resource
      @relationship = relationship
      @resource_ids = resource_ids
      super(code, options)
    end

    def to_hash(serializer = nil)
      if serializer
        serializer.serialize_to_links_hash(parent_resource, relationship, resource_ids)
      else
        # :nocov:
        {}
        # :nocov:
      end
    end
  end
end

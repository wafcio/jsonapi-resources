module JSONAPI
  module Exceptions
    class InvalidInclude < Error
      attr_accessor :relationship, :resource

      def initialize(resource, relationship, error_object_overrides = {})
        @resource = resource
        @relationship = relationship
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_INCLUDE,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_include.title',
                                                   default: 'Invalid field'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_include.detail',
                                                    default: "#{relationship} is not a valid relationship of #{resource}",
                                                    relationship: relationship, resource: resource))]
      end
    end
  end
end

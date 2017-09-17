module JSONAPI
  module Exceptions
    class InvalidResource < Error
      attr_accessor :resource

      def initialize(resource, error_object_overrides = {})
        @resource = resource
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_RESOURCE,
                             status: :bad_request,
                             title: I18n.t('jsonapi-resources.exceptions.invalid_resource.title',
                                           default: 'Invalid resource'),
                             detail: I18n.t('jsonapi-resources.exceptions.invalid_resource.detail',
                                            default: "#{resource} is not a valid resource.", resource: resource))]
      end
    end
  end
end

module JSONAPI
  module Exceptions
    class InvalidField < Error
      attr_accessor :field, :type

      def initialize(type, field, error_object_overrides = {})
        @field = field
        @type = type
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_FIELD,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_field.title',
                                                   default: 'Invalid field'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_field.detail',
                                                    default: "#{field} is not a valid field for #{type}.",
                                                    field: field, type: type))]
      end
    end
  end
end

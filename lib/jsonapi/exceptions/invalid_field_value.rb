module JSONAPI
  module Exceptions
    class InvalidFieldValue < Error
      attr_accessor :field, :value

      def initialize(field, value, error_object_overrides = {})
        @field = field
        @value = value
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_FIELD_VALUE,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_field_value.title',
                                                   default: 'Invalid field value'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_field_value.detail',
                                                    default: "#{value} is not a valid value for #{field}.",
                                                    value: value, field: field))]
      end
    end
  end
end

module JSONAPI
  module Exceptions
    class InvalidFilterValue < Error
      attr_accessor :filter, :value

      def initialize(filter, value, error_object_overrides = {})
        @filter = filter
        @value = value
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_FILTER_VALUE,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_filter_value.title',
                                                   default: 'Invalid filter value'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_filter_value.detail',
                                                    default: "#{value} is not a valid value for #{filter}.",
                                                    value: value, filter: filter))]
      end
    end
  end
end

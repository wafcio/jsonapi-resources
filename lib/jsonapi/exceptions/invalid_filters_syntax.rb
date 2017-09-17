module JSONAPI
  module Exceptions
    class InvalidFiltersSyntax < Error
      attr_accessor :filters

      def initialize(filters, error_object_overrides = {})
        @filters = filters
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_FILTERS_SYNTAX,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_filter_syntax.title',
                                                   default: 'Invalid filters syntax'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_filter_syntax.detail',
                                                    default: "#{filters} is not a valid syntax for filtering.",
                                                    filters: filters))]
      end
    end
  end
end

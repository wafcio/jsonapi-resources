module JSONAPI
  module Exceptions
    class FilterNotAllowed < Error
      attr_accessor :filter

      def initialize(filter, error_object_overrides = {})
        @filter = filter
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::FILTER_NOT_ALLOWED,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.filter_not_allowed.title',
                                                   default: 'Filter not allowed'),
                             detail: I18n.translate('jsonapi-resources.exceptions.filter_not_allowed.detail',
                                                    default: "#{filter} is not allowed.", filter: filter))]
      end
    end
  end
end

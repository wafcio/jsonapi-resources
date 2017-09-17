module JSONAPI
  module Exceptions
    class InvalidPageValue < Error
      attr_accessor :page, :value

      def initialize(page, value, error_object_overrides = {})
        @page = page
        @value = value
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_PAGE_VALUE,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_page_value.title',
                                                   default: 'Invalid page value'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_page_value.detail',
                                                    default: "#{value} is not a valid value for #{page} page parameter.",
                                                    value: value, page: page))]
      end
    end
  end
end

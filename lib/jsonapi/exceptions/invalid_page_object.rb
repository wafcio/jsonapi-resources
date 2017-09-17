module JSONAPI
  module Exceptions
    class InvalidPageObject < Error
      def errors
        [create_error_object(code: JSONAPI::INVALID_PAGE_OBJECT,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_page_object.title',
                                                   default: 'Invalid Page Object'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_page_object.detail',
                                                    default: 'Invalid Page Object.'))]
      end
    end
  end
end

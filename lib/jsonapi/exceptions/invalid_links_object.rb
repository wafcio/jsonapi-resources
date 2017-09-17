module JSONAPI
  module Exceptions
    class InvalidLinksObject < Error
      def errors
        [create_error_object(code: JSONAPI::INVALID_LINKS_OBJECT,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_links_object.title',
                                                   default: 'Invalid Links Object'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_links_object.detail',
                                                    default: 'Data is not a valid Links Object.'))]
      end
    end
  end
end

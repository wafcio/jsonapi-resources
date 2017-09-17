module JSONAPI
  module Exceptions
    class MissingKey < Error
      def errors
        [create_error_object(code: JSONAPI::KEY_ORDER_MISMATCH,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.missing_key.title',
                                                   default: 'A key is required'),
                             detail: I18n.translate('jsonapi-resources.exceptions.missing_key.detail',
                                                    default: 'The resource object does not contain a key.'))]
      end
    end
  end
end

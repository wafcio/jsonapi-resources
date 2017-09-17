module JSONAPI
  module Exceptions
    class InvalidRequestFormat < Error
      def errors
        [create_error_object(code: JSONAPI::BAD_REQUEST,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_request_format.title',
                                                   default: 'Bad Request'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_request_format.detail',
                                                    default: 'Request must be a hash'))]
      end
    end
  end
end

module JSONAPI
  module Exceptions
    class BadRequest < Error
      def initialize(exception, error_object_overrides = {})
        @exception = exception
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::BAD_REQUEST,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.bad_request.title',
                                                   default: 'Bad Request'),
                             detail: I18n.translate('jsonapi-resources.exceptions.bad_request.detail',
                                                    default: @exception))]
      end
    end
  end
end

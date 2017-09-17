module JSONAPI
  module Exceptions
    class InternalServerError < Error
      attr_accessor :exception

      def initialize(exception, error_object_overrides = {})
        @exception = exception
        super(error_object_overrides)
      end

      def errors
        if JSONAPI.configuration.include_backtraces_in_errors
          meta = Hash.new
          meta[:exception] = exception.message
          meta[:backtrace] = exception.backtrace
        end

        [create_error_object(code: JSONAPI::INTERNAL_SERVER_ERROR,
                             status: :internal_server_error,
                             title: I18n.t('jsonapi-resources.exceptions.internal_server_error.title',
                                           default: 'Internal Server Error'),
                             detail: I18n.t('jsonapi-resources.exceptions.internal_server_error.detail',
                                            default: 'Internal Server Error'),
                             meta: meta)]
      end
    end
  end
end

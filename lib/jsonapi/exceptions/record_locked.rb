module JSONAPI
  module Exceptions
    class RecordLocked < Error
      attr_accessor :message

      def initialize(message, error_object_overrides = {})
        @message = message
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::LOCKED,
                             status: :locked,
                             title: I18n.translate('jsonapi-resources.exceptions.record_locked.title',
                                                   default: 'Locked resource'),
                             detail: "#{message}")]
      end
    end
  end
end

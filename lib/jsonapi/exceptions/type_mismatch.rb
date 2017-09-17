module JSONAPI
  module Exceptions
    class TypeMismatch < Error
      attr_accessor :type

      def initialize(type, error_object_overrides = {})
        @type = type
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::TYPE_MISMATCH,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.type_mismatch.title',
                                                   default: 'Type Mismatch'),
                             detail: I18n.translate('jsonapi-resources.exceptions.type_mismatch.detail',
                                                    default: "#{type} is not a valid type for this operation.", type: type))]
      end
    end
  end
end

module JSONAPI
  module Exceptions
    class InvalidFieldFormat < Error
      def errors
        [create_error_object(code: JSONAPI::INVALID_FIELD_FORMAT,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_field_format.title',
                                                   default: 'Invalid field format'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_field_format.detail',
                                                    default: 'Fields must specify a type.'))]
      end
    end
  end
end

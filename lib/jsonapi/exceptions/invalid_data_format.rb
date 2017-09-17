module JSONAPI
  module Exceptions
    class InvalidDataFormat < Error
      def errors
        [create_error_object(code: JSONAPI::INVALID_DATA_FORMAT,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_data_format.title',
                                                   default: 'Invalid data format'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_data_format.detail',
                                                    default: 'Data must be a hash.'))]
      end
    end
  end
end

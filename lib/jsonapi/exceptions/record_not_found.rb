module JSONAPI
  module Exceptions
    class RecordNotFound < Error
      attr_accessor :id

      def initialize(id, error_object_overrides = {})
        @id = id
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::RECORD_NOT_FOUND,
                             status: :not_found,
                             title: I18n.translate('jsonapi-resources.exceptions.record_not_found.title',
                                                   default: 'Record not found'),
                             detail: I18n.translate('jsonapi-resources.exceptions.record_not_found.detail',
                                                    default: "The record identified by #{id} could not be found.", id: id))]
      end
    end
  end
end

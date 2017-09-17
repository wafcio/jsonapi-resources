module JSONAPI
  module Exceptions
    class SaveFailed < Error
      def errors
        [create_error_object(code: JSONAPI::SAVE_FAILED,
                             status: :unprocessable_entity,
                             title: I18n.translate('jsonapi-resources.exceptions.save_failed.title',
                                                   default: 'Save failed or was cancelled'),
                             detail: I18n.translate('jsonapi-resources.exceptions.save_failed.detail',
                                                    default: 'Save failed or was cancelled'))]
      end
    end
  end
end

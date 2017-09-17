module JSONAPI
  module Exceptions
    class KeyNotIncludedInURL < Error
      attr_accessor :key

      def initialize(key, error_object_overrides = {})
        @key = key
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::KEY_NOT_INCLUDED_IN_URL,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.key_not_included_in_url.title',
                                                   default: 'Key is not included in URL'),
                             detail: I18n.translate('jsonapi-resources.exceptions.key_not_included_in_url.detail',
                                                    default: "The URL does not support the key #{key}",
                                                    key: key))]
      end
    end
  end
end

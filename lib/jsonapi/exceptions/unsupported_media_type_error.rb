module JSONAPI
  module Exceptions
    class UnsupportedMediaTypeError < Error
      attr_accessor :media_type

      def initialize(media_type, error_object_overrides = {})
        @media_type = media_type
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::UNSUPPORTED_MEDIA_TYPE,
                             status: :unsupported_media_type,
                             title: I18n.translate('jsonapi-resources.exceptions.unsupported_media_type.title',
                                                   default: 'Unsupported media type'),
                             detail: I18n.translate('jsonapi-resources.exceptions.unsupported_media_type.detail',
                                                    default: "All requests that create or update must use the '#{JSONAPI::MEDIA_TYPE}' Content-Type. This request specified '#{media_type}'.",
                                                    needed_media_type: JSONAPI::MEDIA_TYPE,
                                                    media_type: media_type))]
      end
    end
  end
end

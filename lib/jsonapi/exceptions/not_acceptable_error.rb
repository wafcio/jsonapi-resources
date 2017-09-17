module JSONAPI
  module Exceptions
    class NotAcceptableError < Error
      attr_accessor :media_type

      def initialize(media_type, error_object_overrides = {})
        @media_type = media_type
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::NOT_ACCEPTABLE,
                             status: :not_acceptable,
                             title: I18n.translate('jsonapi-resources.exceptions.not_acceptable.title',
                                                   default: 'Not acceptable'),
                             detail: I18n.translate('jsonapi-resources.exceptions.not_acceptable.detail',
                                                    default: "All requests must use the '#{JSONAPI::MEDIA_TYPE}' Accept without media type parameters. This request specified '#{media_type}'.",
                                                    needed_media_type: JSONAPI::MEDIA_TYPE,
                                                    media_type: media_type))]
      end
    end
  end
end

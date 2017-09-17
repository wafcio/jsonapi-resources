module JSONAPI
  module Exceptions
    class ValidationErrors < Error
      attr_reader :error_messages, :error_metadata, :resource_relationships, :resource_class

      def initialize(resource, error_object_overrides = {})
        @error_messages = resource.model_error_messages
        @error_metadata = resource.validation_error_metadata
        @resource_class = resource.class
        @resource_relationships = resource.class._relationships.keys
        @key_formatter = JSONAPI.configuration.key_formatter
        super(error_object_overrides)
      end

      def format_key(key)
        @key_formatter.format(key)
      end

      def errors
        error_messages.flat_map do |attr_key, messages|
          messages.map { |message| json_api_error(attr_key, message) }
        end
      end

      private

      def json_api_error(attr_key, message)
        create_error_object(code: JSONAPI::VALIDATION_ERROR,
                            status: :unprocessable_entity,
                            title: message,
                            detail: detail(attr_key, message),
                            source: { pointer: pointer(attr_key) },
                            meta: metadata_for(attr_key, message))
      end

      def metadata_for(attr_key, message)
        return if error_metadata.nil?
        error_metadata[attr_key] ? error_metadata[attr_key][message] : nil
      end

      def detail(attr_key, message)
        general_error?(attr_key) ? message : "#{format_key(attr_key)} - #{message}"
      end

      def pointer(attr_or_relationship_name)
        return '/data' if general_error?(attr_or_relationship_name)
        formatted_attr_or_relationship_name = format_key(attr_or_relationship_name)
        if resource_relationships.include?(attr_or_relationship_name)
          "/data/relationships/#{formatted_attr_or_relationship_name}"
        else
          "/data/attributes/#{formatted_attr_or_relationship_name}"
        end
      end

      def general_error?(attr_key)
        attr_key.to_sym == :base && !resource_class._has_attribute?(attr_key)
      end
    end
  end
end

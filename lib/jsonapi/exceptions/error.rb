module JSONAPI
  module Exceptions
    class Error < RuntimeError
      attr :error_object_overrides

      def initialize(error_object_overrides = {})
        @error_object_overrides = error_object_overrides
      end

      def create_error_object(error_defaults)
        JSONAPI::Error.new(error_defaults.merge(error_object_overrides))
      end

      def errors
        # :nocov:
        raise NotImplementedError, "Subclass of Error must implement errors method"
        # :nocov:
      end
    end
  end
end

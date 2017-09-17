module JSONAPI
  module Exceptions
    class Errors < Error
      def initialize(errors, error_object_overrides = {})
        @errors = errors

        @errors.each do |error|
          error.update_with_overrides(error_object_overrides)
        end

        super(error_object_overrides)
      end

      def errors
        @errors
      end
    end
  end
end

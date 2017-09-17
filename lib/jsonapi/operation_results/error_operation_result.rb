module JSONAPI
  class ErrorsOperationResult < OperationResult
    attr_accessor :errors

    def initialize(code, errors, options = {})
      @errors = errors
      super(code, options)
    end

    def to_hash(serializer = nil)
      {
        errors: errors.collect do |error|
          # :nocov:
          error.to_hash
          # :nocov:
        end
      }
    end
  end
end

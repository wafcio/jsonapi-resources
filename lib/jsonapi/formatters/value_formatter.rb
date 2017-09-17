module JSONAPI
  class ValueFormatter < Formatter
    class << self
      def format(raw_value)
        super(raw_value)
      end

      def unformat(value)
        super(value)
      end

      def value_formatter_for(type)
        "#{type.to_s.camelize}ValueFormatter".safe_constantize
      end
    end
  end
end

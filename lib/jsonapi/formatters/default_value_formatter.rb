class DefaultValueFormatter < JSONAPI::ValueFormatter
  class << self
    def format(raw_value)
      case raw_value
        when Date, Time, DateTime, ActiveSupport::TimeWithZone, BigDecimal
          # Use the as_json methods added to various base classes by ActiveSupport
          return raw_value.as_json
        else
          return raw_value
      end
    end
  end
end

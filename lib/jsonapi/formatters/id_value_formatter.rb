class IdValueFormatter < JSONAPI::ValueFormatter
  class << self
    def format(raw_value)
      return if raw_value.nil?
      raw_value.to_s
    end
  end
end

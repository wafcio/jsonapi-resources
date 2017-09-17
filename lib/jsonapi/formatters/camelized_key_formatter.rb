class CamelizedKeyFormatter < JSONAPI::KeyFormatter
  class << self
    def format(key)
      super.camelize(:lower)
    end

    def unformat(formatted_key)
      formatted_key.to_s.underscore
    end
  end
end

class DasherizedKeyFormatter < JSONAPI::KeyFormatter
  class << self
    def format(_key)
      super.underscore.dasherize
    end

    def unformat(formatted_key)
      formatted_key.to_s.underscore
    end
  end
end

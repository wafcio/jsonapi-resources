module JSONAPI
  # Warning: Not thread-safe. Wrap in ThreadLocalVar as needed.
  class FormatterWrapperCache
    attr_reader :formatter_klass

    def initialize(formatter_klass)
      @formatter_klass = formatter_klass
      @format_cache = NaiveCache.new{|arg| formatter_klass.format(arg) }
      @unformat_cache = NaiveCache.new{|arg| formatter_klass.unformat(arg) }
    end

    def format(arg)
      @format_cache.get(arg)
    end

    def unformat(arg)
      @unformat_cache.get(arg)
    end

    def cached
      self
    end

    def uncached
      return @formatter_klass
    end
  end
end

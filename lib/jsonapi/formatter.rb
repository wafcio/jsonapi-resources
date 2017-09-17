module JSONAPI
  class Formatter
    class << self
      def format(arg)
        arg.to_s
      end

      def unformat(arg)
        arg
      end

      def cached
        return FormatterWrapperCache.new(self)
      end

      def uncached
        return self
      end

      def formatter_for(format)
        "#{format.to_s.camelize}Formatter".safe_constantize
      end
    end
  end
end

require 'jsonapi/formatters/key_formatter'
require 'jsonapi/formatters/route_formatter'
require 'jsonapi/formatters/value_formatter'
require 'jsonapi/formatters/formatter_wrapper_cache'
require 'jsonapi/formatters/underscored_key_formatter'
require 'jsonapi/formatters/camelized_key_formatter'
require 'jsonapi/formatters/dasherized_key_formatter'
require 'jsonapi/formatters/default_value_formatter'
require 'jsonapi/formatters/id_value_formatter'
require 'jsonapi/formatters/underscored_route_formatter'
require 'jsonapi/formatters/camelized_route_formatter'
require 'jsonapi/formatters/dasherized_route_formatter'

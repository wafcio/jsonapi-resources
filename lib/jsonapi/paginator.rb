module JSONAPI
  class Paginator
    def initialize(_params)
    end

    def apply(_relation, _order_options)
      # relation
    end

    def links_page_params(_options = {})
      # :nocov:
      {}
      # :nocov:
    end

    class << self
      def requires_record_count
        # :nocov:
        false
        # :nocov:
      end

      def paginator_for(paginator)
        paginator_class_name = "#{paginator.to_s.camelize}Paginator"
        paginator_class_name.safe_constantize if paginator_class_name
      end
    end
  end
end

require 'jsonapi/paginators/offset_paginator'
require 'jsonapi/paginators/paged_paginator'

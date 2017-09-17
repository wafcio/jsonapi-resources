module JSONAPI
  class OperationResult
    attr_accessor :code
    attr_accessor :meta
    attr_accessor :links
    attr_accessor :options
    attr_accessor :warnings

    def initialize(code, options = {})
      @code = Rack::Utils.status_code(code)
      @options = options
      @meta = options.fetch(:meta, {})
      @links = options.fetch(:links, {})
      @warnings = options.fetch(:warnings, {})
    end

    def to_hash(serializer = nil)
      {}
    end
  end
end

require 'jsonapi/operation_results/error_operation_result'
require 'jsonapi/operation_results/resource_set_operation_result'
require 'jsonapi/operation_results/resources_set_operation_result'
require 'jsonapi/operation_results/related_resources_set_operation_result'
require 'jsonapi/operation_results/links_object_operation_result'

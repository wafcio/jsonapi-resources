module JSONAPI
  module Exceptions
    class InvalidSortCriteria < Error
      attr_accessor :sort_criteria, :resource

      def initialize(resource, sort_criteria, error_object_overrides = {})
        @resource = resource
        @sort_criteria = sort_criteria
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::INVALID_SORT_CRITERIA,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.invalid_sort_criteria.title',
                                                   default: 'Invalid sort criteria'),
                             detail: I18n.translate('jsonapi-resources.exceptions.invalid_sort_criteria.detail',
                                                    default: "#{sort_criteria} is not a valid sort criteria for #{resource}",
                                                    sort_criteria: sort_criteria, resource: resource))]
      end
    end
  end
end

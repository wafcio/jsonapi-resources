module JSONAPI
  module Exceptions
    class ParameterMissing < Error
      attr_accessor :param

      def initialize(param, error_object_overrides = {})
        @param = param
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::PARAM_MISSING,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.parameter_missing.title',
                                                   default: 'Missing Parameter'),
                             detail: I18n.translate('jsonapi-resources.exceptions.parameter_missing.detail',
                                                    default: "The required parameter, #{param}, is missing.", param: param))]
      end
    end
  end
end

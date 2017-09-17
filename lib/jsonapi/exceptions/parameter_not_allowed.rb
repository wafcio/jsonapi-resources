module JSONAPI
  module Exceptions
    class ParameterNotAllowed < Error
      attr_accessor :param

      def initialize(param, error_object_overrides = {})
        @param = param
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::PARAM_NOT_ALLOWED,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.parameter_not_allowed.title',
                                                   default: 'Param not allowed'),
                             detail: I18n.translate('jsonapi-resources.exceptions.parameters_not_allowed.detail',
                                                    default: "#{param} is not allowed.", param: param))]
      end
    end
  end
end

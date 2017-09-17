module JSONAPI
  module Exceptions
    class PageParametersNotAllowed < Error
      attr_accessor :params

      def initialize(params, error_object_overrides = {})
        @params = params
        super(error_object_overrides)
      end

      def errors
        params.collect do |param|
          create_error_object(code: JSONAPI::PARAM_NOT_ALLOWED,
                              status: :bad_request,
                              title: I18n.translate('jsonapi-resources.exceptions.page_parameters_not_allowed.title',
                                                    default: 'Page parameter not allowed'),
                              detail: I18n.translate('jsonapi-resources.exceptions.page_parameters_not_allowed.detail',
                                                     default: "#{param} is not an allowed page parameter.",
                                                     param: param))
        end
      end
    end
  end
end

module JSONAPI
  module Exceptions
    class ToManySetReplacementForbidden < Error
      def errors
        [create_error_object(code: JSONAPI::FORBIDDEN,
                             status: :forbidden,
                             title: I18n.translate('jsonapi-resources.exceptions.to_many_set_replacement_forbidden.title',
                                                   default: 'Complete replacement forbidden'),
                             detail: I18n.translate('jsonapi-resources.exceptions.to_many_set_replacement_forbidden.detail',
                                                    default: 'Complete replacement forbidden for this relationship'))]
      end
    end
  end
end

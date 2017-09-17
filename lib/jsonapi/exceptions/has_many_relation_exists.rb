module JSONAPI
  module Exceptions
    class HasManyRelationExists < Error
      attr_accessor :id

      def initialize(id, error_object_overrides = {})
        @id = id
        super(error_object_overrides)
      end

      def errors
        [create_error_object(code: JSONAPI::RELATION_EXISTS,
                             status: :bad_request,
                             title: I18n.translate('jsonapi-resources.exceptions.has_many_relation.title',
                                                   default: 'Relation exists'),
                             detail: I18n.translate('jsonapi-resources.exceptions.has_many_relation.detail',
                                                    default: "The relation to #{id} already exists.",
                                                    id: id))]
      end
    end
  end
end

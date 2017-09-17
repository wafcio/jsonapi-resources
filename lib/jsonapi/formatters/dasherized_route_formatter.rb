class DasherizedRouteFormatter < JSONAPI::RouteFormatter
  class << self
    def format(_route)
      super.dasherize
    end

    def unformat(formatted_route)
      formatted_route.to_s.underscore
    end
  end
end

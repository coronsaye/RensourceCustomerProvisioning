class RoutingErrorHandler
  module ActionDispatch
    class ShowExceptions
      def render_exception(env, exception)
        if exception.kind_of? ActionController::RoutingError
          render(500, 'it was routing error')

        end
      end
    end
  end
end
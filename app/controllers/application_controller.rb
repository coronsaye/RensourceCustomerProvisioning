class ApplicationController < ActionController::API


  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render_exception(404, "Routing Error", exception)
  end

  def action_missing(m, *args, &block)
    Rails.logger.error(m)
    redirect_to 'error#index'
  end

end

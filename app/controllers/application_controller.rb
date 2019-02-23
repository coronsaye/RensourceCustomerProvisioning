class ApplicationController < ActionController::API


  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    #render_exception(404, "Routing Error", exception)
    Rails.logger.error(error)
    redirect_to 'http://3.120.234.9:8080/error/index'
  end

  def action_missing(m, *args, &block)
    Rails.logger.error(m)
    redirect_to 'http://3.120.234.9:8080/error/index'
  end

end

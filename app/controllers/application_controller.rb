class ApplicationController < ActionController::API


  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    #render_exception(404, "Routing Error", exception)
    Rails.logger.error(error)
    
    resp = {:status => "404", :message => "routing error"}

    render json: resp
  end

  def action_missing(m, *args, &block)
    Rails.logger.error(m)
    redirect_to 'error/index'
  end

end

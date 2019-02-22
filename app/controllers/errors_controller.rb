class ErrorsController < ApplicationController
def not_found

  render :json => "{status : 404,message : Invalid Request}"
end

  def index
    render :json => "{status : 500,message : Internal Server Error}"
  end
end
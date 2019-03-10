class CustomersController < ApplicationController
  
  require 'ostruct'
  require './app/core/core.rb'

  def select

    if params[:type] == 1.to_s
      @obj = Customer.where('market = ? and status = ?', params[:market], false).first
    else
      @obj = Account.where('market = ? and status = ?', params[:market], false).first
    end

    @refno = ''

    if(@obj != nil)

      @obj.status = true
      @obj.save

      @refno = @obj.ref_no.to_s

    end

    if(@obj == nil)
      resp = {:status => "404", :message => "not found",:ref_no => @refno}
    else
      resp = {:status => response.status.to_s, :message => response.status_message, :ref_no => @refno}
    end

    render json: resp

  end

  def generate

    count = params[:count]
    start = params[:start]
    type = params[:type]
    market = params[:market]

    @list = Core.generate_customerids(
      market_code: market, 
      no_of_ids: count, 
      type_of_id: type, 
      start_at: start)

    render json: @list

  end

end

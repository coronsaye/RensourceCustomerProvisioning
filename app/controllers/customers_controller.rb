class CustomersController < ApplicationController

  def fetch
    @customer = Customer.where(market: params[:market])
    render json: @customer
  end

  def select

    if params[:type] == 1.to_s
      @obj = Customer.where('market = ? and status = ?', params[:market], false).first
    else
      @obj = Account.where('market = ? and status = ?', params[:market], false).first
    end

    if(@obj != nil)

      @obj.status = true
      @obj.save

      render json: '{status : 1,message : '+ @obj.ref_no.to_s + '}'
    else
      render json: '{status : 0, message : no records found!}'
    end

  end

  def generate

    count = params[:count]
    start = params[:start]
    type = params[:type]

    market = params[:market]
    count = count.to_i
    start = start.to_i
    len = 9

    @list = []

    while count > 0

      count -= 1
      start += 1

      if start.to_s.length < len
        pad = len - start.to_s.length
        @value = '0' + start.to_s
        while pad > 0
          @value = '0' + @value
          pad -= 1
        end
      end

      if type == '1'
        ref_no = market + '-' + @value
        @obj = Customer.new
      else
        ref_no = market + @value
        @obj = Account.new
      end


      @obj.market = market
      @obj.ref_no = ref_no
      @obj.status = false

      @obj.save


      @list.push(@obj)

    end

    render json: @list

  end

end

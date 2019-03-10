class Generator

    def initialize(market_code:, no_of_ids:, type_of_id:, start_at:)
        @count = no_of_ids
        @type = type_of_id
        @market = market_code
        @start = start_at
    end

    def generate

        count = @count.to_i
        start = @start.to_i
        len = 6

        @market_obj = Market.where('code = ?', @market).first

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

            if @type == '1'
                ref_no = @market + @value
                if (Customer.where('ref_no = ?',ref_no).first) == nil
                    @obj = Customer.new
                    @exist = false
                else
                    @exist = true
                end

            else
                ref_no = @market_obj.number_code + @value
                if (Account.where('ref_no = ?',ref_no).first) == nil
                    @obj = Account.new
                    @exist = false
                else
                    @exist = true
                end

            end

            if(@exist == false)
                @obj.market = @market
                @obj.ref_no = ref_no
                @obj.status = false
                @obj.save
                @list.push(@obj)
            end

        end

        @list

    end

end
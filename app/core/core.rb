require 'generator.rb'
module Core
    
    def self.generate_customerids(market_code: , no_of_ids: , type_of_id:, start_at: )

        Generator.new( market_code: market_code, no_of_ids: no_of_ids, type_of_id: type_of_id, start_at: start_at )
            .generate

    end
    
end
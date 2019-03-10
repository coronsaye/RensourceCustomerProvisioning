class Market < ApplicationRecord
    validates_presence_of :code
    validates_presence_of :number_code
  
end
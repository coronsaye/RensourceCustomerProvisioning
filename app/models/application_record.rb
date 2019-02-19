class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_one_attached :avatar

    rails_admin do
      field :avatar, :active_storage
    end

end

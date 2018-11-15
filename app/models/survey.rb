class Survey < ApplicationRecord
    belongs_to :user
    
    validates :user_id, presence: true
    validates :category, presence: true

end

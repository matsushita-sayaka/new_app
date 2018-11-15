class Recipe < ApplicationRecord
    
    has_many :users, through: :ingredients
    has_many :ingredients
    
end

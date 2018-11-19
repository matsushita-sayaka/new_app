class Ingredient < ApplicationRecord
    
    belongs_to :user
    belongs_to :recipe
    
    default_scope -> { order(check_box) }
    
end

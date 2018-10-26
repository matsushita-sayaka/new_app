class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :post_details, dependent: :destroy
    default_scope -> { order('created_at DESC') }
    
    validates :user_id, presence: true
    
end

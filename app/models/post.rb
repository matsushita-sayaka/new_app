class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :post_details, dependent: :destroy
    
    has_many :users, through: :likes
    has_many :likes
    
    has_many :users, through: :comments
    has_many :comments
    
    accepts_nested_attributes_for :post_details, allow_destroy: true
    default_scope -> { order('created_at DESC') }
    
    validates :user_id, presence: true
end

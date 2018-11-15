class Post < ApplicationRecord
    
    belongs_to :user
    has_many :post_details, dependent: :destroy
    
    has_many :users, through: :likes
    has_many :likes, dependent: :delete_all
    
    has_many :users, through: :comments
    has_many :comments, dependent: :delete_all
    
    accepts_nested_attributes_for :post_details, allow_destroy: true
    default_scope -> { order('created_at DESC') }
    
    validates :user_id, presence: true
    validates :category, presence: true
    validates :title, presence: true
    validates :main_content, presence: true
    
end

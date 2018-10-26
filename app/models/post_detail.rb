class PostDetail < ActiveRecord::Base
    validates :post_id, presence: true
    
    belongs_to :post
    default_scope -> { order('created_at DESC') }
end

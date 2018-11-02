class PostDetail < ActiveRecord::Base
    
    belongs_to :post
    default_scope -> { order('created_at DESC') }
    
    mount_uploader :image, ImageUploader
end

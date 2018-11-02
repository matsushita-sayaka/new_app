class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
    validates :name, presence: true, length: { maximum: 50 }
    
    
    
    has_many :invites, dependent: :destroy
    
    has_many :recipes, through: :ingredients
    has_many :ingredients
    
    has_many :posts, through: :likes
    has_many :likes, dependent: :destroy
    
    has_many :posts, through: :comments
    has_many :comments, dependent: :destroy
    
    has_many :user_id_rq, through: :friends
    has_many :friends, dependent: :destroy
    has_many :reverse_friends, foreign_key: "user_id", class_name: "Friend", dependent:  :destroy
    has_many :user_id, through: :reverse_friends
    
    has_many :surveys, dependent: :destroy
    
    has_many :posts, dependent: :destroy
    
    mount_uploader :image, ImageUploader
    
    scope :get_by_name, ->(name) {
    where("name like ?" , "%#{name}%")
    }
    
    def like?(post)
        likes.find_by(post_id: post.id)
    end
    
end

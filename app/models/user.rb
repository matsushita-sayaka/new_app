class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true, length: { maximum: 50 }
    
    has_many :recipes, through: :ingredients
    has_many :ingredients, dependent: :destroy
    
    has_many :posts, through: :likes
    has_many :likes, dependent: :delete_all
    
    has_many :posts, through: :comments
    has_many :comments, dependent: :delete_all
    
    has_many :friends_of_user, class_name: 'Friend', foreign_key: 'user_id',dependent: :delete_all
    has_many :friends_of_user_id_rq, class_name: 'Friend', foreign_key: 'user_id_rq',dependent: :delete_all
    has_many :user_id, through: :friends_of_user
    has_many :user_id_rq, through: :friends_of_user_id_rq
    
    has_many :talks_of_written_user, class_name: 'Talk', foreign_key: 'written_user_id',dependent: :destroy
    has_many :talks_of_receiver_user, class_name: 'Talk', foreign_key: 'receiver_user_id',dependent: :destroy
    has_many :written_user_id, through: :talks_of_written_user
    has_many :receiver_user_id, through: :talks_of_receiver_user
    
    
    has_many :surveys, dependent: :destroy
    
    has_many :posts, dependent: :destroy
    
    scope :get_by_name, ->(name) {
    where("name like ?" , "%#{name}%")
    }
    
    def like?(post)
        likes.find_by(post_id: post.id)
    end
    
    def accept?(user)
       friends_of_user.find_by(user_id_rq: user.id) && friends_of_user_id_rq.find_by(user_id: user.id)
    end
    
    def friend_request?(user)
       friends_of_user.find_by(user_id_rq: user.id)
    end
    
    def wait?(user)
      friends_of_user_id_rq.find_by(user_id: user.id)
    end
    
end

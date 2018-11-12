class Talk < ActiveRecord::Base
    belongs_to :written_user, class_name: 'User', foreign_key: 'written_user_id'
    belongs_to :receiver_user, class_name: 'User', foreign_key: 'receiver_user_id'
    
    validates :written_user, presence: true
    validates :receiver_user, presence: true
    validates :message, presence: true
end

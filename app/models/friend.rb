class Friend < ActiveRecord::Base
    belongs_to :user
    belongs_to :rq, class_name: "User",foreign_key: "user_id_rq"
    
    validates :user_id, presence: true
    validates :user_id_rq, presence: true
     validates :status, presence: true
end

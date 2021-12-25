class Like < ApplicationRecord
    # validates
    validates :user_id, presence: true
    validates :post_id, presence: true

    # relationship
    belongs_to :user
    belongs_to :post


end

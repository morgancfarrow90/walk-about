class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :comment, presence: true
  validates :activity, uniqueness: {scope: :user_id, message: "may only have one comment per user"}

  
end

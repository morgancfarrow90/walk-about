class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :comment, presence: true
  validates :activity, uniqueness: {scope: :user_id, message: "may only have one comment per user"}
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  scope :newest_first, -> { order(created_at: :desc) }

  def self.last_three
    all.order(created_at: :desc).limit(3)
  end

  def self.five_star
    where("rating = 5")
  end



end

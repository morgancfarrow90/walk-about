class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def self.categoryfilter(params)
      where("category_id = ?", params)
    end

  def self.search(params)
    where("LOWER(activities.name) LIKE :term OR LOWER(activities.description) LIKE :term", term: "%#{params}%")
  end
end

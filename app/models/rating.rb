class Rating < ApplicationRecord
  belongs_to :store
  belongs_to :user
  validates :score, inclusion: { in: 1..5 }
end

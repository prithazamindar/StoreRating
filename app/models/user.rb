class User < ApplicationRecord
  enum role: { customer: 0, store_owner: 1, admin: 2 }
  has_many :stores, foreign_key: 'owner_id'
  has_many :ratings
end

class Store < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :ratings
end

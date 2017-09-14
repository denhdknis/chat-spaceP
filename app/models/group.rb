class Group < ApplicationRecord
  has_many :users, through: :menbers
  has_many :menbers
  accepts_nested_attributes_for :menbers
end

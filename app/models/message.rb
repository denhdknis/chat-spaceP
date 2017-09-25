class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, :email, presence: true ,uniqueness: true
end

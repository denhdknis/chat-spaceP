class Member < ApplicationRecord
  #中間テーブルです！
  belongs_to :group
  belongs_to :user
end

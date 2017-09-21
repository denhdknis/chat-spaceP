class Member < ApplicationRecord
  #中間テーブルです！
  belongs_to :user
  belongs_to :group
end

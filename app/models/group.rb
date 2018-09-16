class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  has_many :messages
  accepts_nested_attributes_for :members

  validates :name, presence: true

  def last_message
  	if (last_message = messages.last).present?
      if last_message.body?
       last_message.body
      else
        '画像が投稿されています'
      end
    else
    	'まだメッセージが投稿されていません'
    end
  end


end

class AddIndexMembersGroupId < ActiveRecord::Migration[5.0]
  def change
  	add_index :members ,[:group_id,:user_id]
  end
end

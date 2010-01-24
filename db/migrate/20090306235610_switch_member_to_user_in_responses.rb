class SwitchMemberToUserInResponses < ActiveRecord::Migration
  def self.up
    remove_index :responses, :member_id
    rename_column :responses, :member_id, :user_id
    add_index :responses, :user_id
  end

  def self.down
    remove_index :responses, :user_id
    rename_column :responses, :user_id, :member_id
    add_index :responses, :member_id
  end
  
end

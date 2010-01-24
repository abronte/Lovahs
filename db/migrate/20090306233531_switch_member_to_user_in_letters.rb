class SwitchMemberToUserInLetters < ActiveRecord::Migration
  def self.up
    remove_index :letters, :member_id
    rename_column :letters, :member_id, :user_id
    add_index :letters, :user_id
  end

  def self.down
    remove_index :letters, :user_id
    rename_column :letters, :user_id, :member_id
    add_index :letters, :member_id
  end
end

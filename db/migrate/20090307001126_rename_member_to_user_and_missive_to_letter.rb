class RenameMemberToUserAndMissiveToLetter < ActiveRecord::Migration
  def self.up
    rename_table :member_types, :user_types
    rename_column :user_types, :member_type_name, :type_name
    rename_table :missive_tags, :letter_tags
    rename_column :letter_tags, :missive_id, :letter_id
    rename_column :letter_tags, :member_id, :user_id
    rename_table :member_profiles, :user_profiles
  end

  def self.down
    rename_table :user_types, :member_types 
    rename_column :member_types, :type_name, :member_type_name
    rename_table :letter_tags, :missive_tags 
    rename_column :missive_tags, :letter_id, :missive_id
    rename_column :missive_tags, :user_id, :member_id
    rename_table :user_profiles, :member_profiles 
  end
end

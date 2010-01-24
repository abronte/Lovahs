class AddSaltToMembers < ActiveRecord::Migration
  def self.up
    rename_column :members, :password, :encrypted_password
    add_column :members, :salt, :string, :limit => 40 
  end

  def self.down
    remove_column :members, :salt
    rename_column :members, :encrypted_password, :password
  end
end

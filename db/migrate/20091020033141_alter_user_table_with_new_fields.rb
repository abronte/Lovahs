class AlterUserTableWithNewFields < ActiveRecord::Migration
    def self.up
      rename_column :users, :login, :login_username
      add_column :users, :status,    :string
      add_column :users, :first_name,    :string
      add_column :users, :last_name,    :string
      add_column :users, :gender,    :string
    end

    def self.down
      rename_column :users, :login_username, :login
      remove_column :users, :status
      remove_column :users, :first_name
      remove_column :users, :last_name
      remove_column :users, :gender
    end
end

class AddTitleToMissives < ActiveRecord::Migration
  def self.up
    add_column :missives, :title, :string
  end

  def self.down
    remove_column :missives, :title
  end
end

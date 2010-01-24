class CreateGroupNames < ActiveRecord::Migration
  def self.up
    create_table :group_names do |t|
		t.string :group_name

      t.timestamps
    end
	add_index :group_names, :group_name
  end

  def self.down
    drop_table :group_names
  end
end

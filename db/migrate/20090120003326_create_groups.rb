class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
		t.integer	:group_name_id #Distinguish between groups
		t.integer	:member_id  #Distinguish between groups

      t.timestamps
    end
	#Indices for group lookups (id is implicit unique key created by rails)
	add_index	:groups, :member_id # Obviously who is a group member
	add_index	:groups, :group_name_id  # Obviously which group this is

  end

  def self.down
    drop_table :groups
  end
end

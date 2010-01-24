class CreateMemberTypes < ActiveRecord::Migration
  def self.up
    create_table :member_types do |t|
		t.string	:member_type_name	#The types of members

      t.timestamps
    end
	add_index :member_types, :member_type_name
  end

  def self.down
    drop_table :member_types
  end
end

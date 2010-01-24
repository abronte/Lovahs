class CreateMissives < ActiveRecord::Migration
  def self.up
    create_table :missives do |t|
		t.integer	:member_id	#id of the record of the member that created the missive
		t.integer	:missive_class_id # used to differentiate safe for all, safe for non-kids, safe only for adults (G,PG,R,X)
		t.text		:contents	# the actual contents of the Missive
      t.timestamps
    end
	#Indices for missive lookups (id is implicit unique key created by rails)
	add_index	:missives, :member_id # Obviously who created the note, look up for reference
	add_index	:missives, :missive_class_id 
  end

  def self.down
    drop_table :missives
  end
end

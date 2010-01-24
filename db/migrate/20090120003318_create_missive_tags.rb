class CreateMissiveTags < ActiveRecord::Migration
  def self.up
    create_table :missive_tags do |t|
		t.integer :missive_id #Where Tag points to
		t.integer :member_id #Who tag points to
		t.string  :tag_text #The actual tage, limited to 255 characters

      t.timestamps
    end

	#Indices for missive lookups (id is implicit unique key created by rails)
	add_index	:missive_tags, :member_id # Obviously who created the Tag, see what trends are for people
	add_index	:missive_tags, :missive_id # missive tag points to
  end


  def self.down
    drop_table :missive_tags
  end
end

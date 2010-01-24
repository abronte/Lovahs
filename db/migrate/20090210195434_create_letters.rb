class CreateLetters < ActiveRecord::Migration
  def self.up
    create_table :letters do |t|
    	t.integer	:member_id	#id of the record of the member that created the missive
    	t.string  :title
    	t.text		:contents	# the actual contents of the Missive
      t.timestamps
    end
    
    #Indices for missive lookups (id is implicit unique key created by rails)
    add_index	:letters, :member_id # Obviously who created the note, look up for reference
  end

  def self.down
    drop_table :letters
  end
end



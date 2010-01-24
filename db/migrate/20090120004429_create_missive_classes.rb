class CreateMissiveClasses < ActiveRecord::Migration
  def self.up
    create_table :missive_classes do |t|
		t.string	:missive_class #string that identifies what class the missive is

      t.timestamps
    end
	add_index :missive_classes, :missive_class
  end

  def self.down
    drop_table :missive_classes
  end
end

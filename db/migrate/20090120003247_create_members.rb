class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
		t.string	:member_name #Login name for the memeber
		t.string	:member_email #email (and alternate login id, see abov)
		t.string	:password, :limit => 40	#store output of encryption hash of their password
      t.timestamps
    end

	#Indices for member lookups (id is implicit unique key created by rails)
	add_index	:members, :member_name, :unique => true #Make sure we only have one login name
	add_index	:members, :member_email, :unique => true #Make sure we only have one login email

  end

  def self.down
    drop_table :members
  end
end

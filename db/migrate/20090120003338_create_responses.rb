class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
		t.integer	:member_id #Who created the response
		t.integer	:missive_id #Who created the response
		t.integer	:prev_response_id, :null => true #What response this one might be in response to
		t.integer	:missive_eval	#the score the responder gives this missive (+/-?)
		t.text		:reponse_contents #What they said

      t.timestamps #Use to sort time (default)
    end
	#Indices for group lookups (id is implicit unique key created by rails)
	add_index	:responses, :member_id # Obviously who created the reponse
	add_index	:responses, :missive_id # Obviously what message this links to
	add_index	:responses, :prev_response_id 

  end

  def self.down
    drop_table :responses
  end
end

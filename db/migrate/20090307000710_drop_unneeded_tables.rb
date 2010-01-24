class DropUnneededTables < ActiveRecord::Migration
  def self.up
    drop_table :missives #renamed letters
    drop_table :missive_classes #renamed letters
    drop_table :members  #renamed users
    drop_table :member_evals 
    drop_table :response_evals
    drop_table :group_names
    drop_table :groups
  end

  def self.down
      create_table :missives do |t|
  		t.integer	:member_id	#id of the record of the member that created the missive
  		t.integer	:missive_class_id # used to differentiate safe for all, safe for non-kids, safe only for adults (G,PG,R,X)
  		t.text		:contents	# the actual contents of the Missive
        t.timestamps
      end
  	#Indices for missive lookups (id is implicit unique key created by rails)
  	add_index	:missives, :member_id # Obviously who created the note, look up for reference
  	add_index	:missives, :missive_class_id
  	
      create_table :missive_classes do |t|
  		t.string	:missive_class #string that identifies what class the missive is

        t.timestamps
      end
  	add_index :missive_classes, :missive_class  	
    
      create_table :members do |t|
  		t.string	:member_name #Login name for the memeber
  		t.string	:member_email #email (and alternate login id, see abov)
  		t.string	:password, :limit => 40	#store output of encryption hash of their password
        t.timestamps
      end

  	#Indices for member lookups (id is implicit unique key created by rails)
  	add_index	:members, :member_name, :unique => true #Make sure we only have one login name
  	add_index	:members, :member_email, :unique => true #Make sure we only have one login email

      create_table :member_evals do |t|
  	t.integer	:member_id	#Who the eval is for
  	t.integer	:evaluator_id	#the member id of the evaluator
  	t.integer	:eval_score	#the value +/- of the eval
  	t.text		:eval_comment #whatever additional comment the evaluator is giving

        t.timestamps
      end
    	add_index :member_evals, :member_id
  	add_index :member_evals, :evaluator_id
   
   
      create_table :response_evals do |t|
  	t.integer	:response_id	#Which response we are responding to
  	t.integer	:member_id		#Who created the response
  	t.integer	:evaluator_id	#Who crteated the evaluation
  	t.integer	:eval_score		#The value given to the response (+/-)
  	t.text		:eval_comment	#Any additional comment

        t.timestamps
      end
    	add_index :response_evals, :response_id
    	add_index :response_evals, :member_id
  	add_index :response_evals, :evaluator_id
    
    
      create_table :group_names do |t|
  		t.string :group_name

        t.timestamps
      end
  	add_index :group_names, :group_name  
  	
      create_table :groups do |t|
  		t.integer	:group_name_id #Distinguish between groups
  		t.integer	:member_id  #Distinguish between groups

        t.timestamps
      end
  	#Indices for group lookups (id is implicit unique key created by rails)
  	add_index	:groups, :member_id # Obviously who is a group member
  	add_index	:groups, :group_name_id  # Obviously which group this is
  	
  end
end

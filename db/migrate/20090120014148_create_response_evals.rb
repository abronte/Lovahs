class CreateResponseEvals < ActiveRecord::Migration
  def self.up
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

  end

  def self.down
    drop_table :response_evals
  end
end

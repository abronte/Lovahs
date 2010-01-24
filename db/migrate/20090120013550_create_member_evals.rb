class CreateMemberEvals < ActiveRecord::Migration
  def self.up
    create_table :member_evals do |t|
	t.integer	:member_id	#Who the eval is for
	t.integer	:evaluator_id	#the member id of the evaluator
	t.integer	:eval_score	#the value +/- of the eval
	t.text		:eval_comment #whatever additional comment the evaluator is giving

      t.timestamps
    end
  	add_index :member_evals, :member_id
	add_index :member_evals, :evaluator_id
  end

  def self.down
    drop_table :member_evals
  end
end

class RefineResponses < ActiveRecord::Migration
  def self.up
    rename_column :responses, :missive_id, :letter_id
    remove_column :responses, :missive_eval
    remove_column :responses, :prev_response_id
  end

  def self.down
    rename_column :responses, :letter_id, :missive_id
    add_column :responses, :missive_eval, integer
    add_column :responses, :prev_response_id, integer
  end
end

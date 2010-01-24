class CorrectReponseTypo < ActiveRecord::Migration
  def self.up
    rename_column :responses, :reponse_contents, :response_contents
  end

  def self.down
    rename_column :responses, :response_contents, :reponse_contents
  end
end

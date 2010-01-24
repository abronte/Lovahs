class CreateLetterCategories < ActiveRecord::Migration
  def self.up
    create_table "letter_categories" do |t|
      t.string  :label
    end
    
    LetterCategory.create :label => "Marital"
    LetterCategory.create :label => "Unrequited"
    LetterCategory.create :label => "Love at First Sight"
    LetterCategory.create :label => "Workplace"
    LetterCategory.create :label => "Familial"
    LetterCategory.create :label => "Physical"
    LetterCategory.create :label => "Long Distance"
    LetterCategory.create :label => "Sacrificial"
    LetterCategory.create :label => "Cheating"
    LetterCategory.create :label => "Infatuation"
    LetterCategory.create :label => "Taken-for-Granted"
    LetterCategory.create :label => "Platonic"

    add_column :letters, :letter_category_id, :integer, :default => 1
  end

  def self.down
    drop_table :categories
  end
end
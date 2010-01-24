class AddCachedLetterTotalFavorites < ActiveRecord::Migration
     def self.up
          add_column :letters, :cached_total_favorites, :integer, :default => 0
          add_index :letters, :cached_total_favorites
    end

     def self.down
       remove_column :letters, :cached_total_favorites
       remove_index :letters, :cached_total_favorites
     end
end

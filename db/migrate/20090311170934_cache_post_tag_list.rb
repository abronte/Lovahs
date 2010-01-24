class CachePostTagList < ActiveRecord::Migration
  def self.up
       add_column :letters, :cached_tag_list, :string
 end

  def self.down
    remove_column :letters, :cached_tag_list
  end
end

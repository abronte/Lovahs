class Letter < ActiveRecord::Base
  acts_as_taggable
  acts_as_favorite

  belongs_to :user
  belongs_to :letter_category
  
  has_many :responses
  
  validates_presence_of :title, :contents, :user

  has_friendly_id :title, :use_slug => true, :reserved => ["index", "new", "create", "update", "edit", "show", "index", "tag", "tag_cloud", "toggle_favorite", "find_letter"]

end

class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :letter
  
  validates_presence_of :response_contents, :letter, :user
  
end

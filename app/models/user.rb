class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_favorite_user
  acts_as_favorite
  
  # associations
  has_many :letters
  has_many :responses  

  # http://wiki.github.com/thoughtbot/paperclip/usage
  has_attached_file :avatar, :url => "/:attachment/:id/:style/:basename.:extension", :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension", :styles => { :big => "100x100>", :tiny => "24x24>", :small => "32x32>", :medium => "48x48>" }

  # http://stackoverflow.com/questions/1331705/cant-put-email-address-field-on-login-form-authlogic
  def self.find_by_login_or_email(login)
    #User.find_by_login(login) || User.find_by_email(login)
    User.find_by_email(login)
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    #Notifier.deliver_password_reset_instructions(self)
    Emailer.deliver_password_reset_instructions(self)
  end

  # http://www.nathancolgate.com/post/184694426/adding-email-and-user-verification-to-authlogic
  def deliver_verification_instructions!
    reset_perishable_token!
    Emailer.deliver_verification_instructions(self)
  end
  
  def verify!
    self.verified = true
    self.save
  end
   
end

class UserSession < Authlogic::Session::Base
  find_by_login_method :find_by_login_or_email
  
  # http://www.nathancolgate.com/post/184694426/adding-email-and-user-verification-to-authlogic
  validate :check_if_verified
  
  private
  def check_if_verified
    errors.add(:base, "You have not yet verified your account, an email has just been sent to you.") unless attempted_record && attempted_record.verified
    if (attempted_record && attempted_record.verified)
    else
      if(attempted_record.id)
        @user = User.find(attempted_record.id)
        @user.deliver_verification_instructions!
      end
    end
  end
  
end
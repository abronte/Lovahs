# http://www.tutorialspoint.com/ruby-on-rails/rails-send-email.htm
class Emailer < ActionMailer::Base
  default_url_options[:host] = "www.lovahs.com"
  
   def comment(link, recipient, subject, sent_at = Time.now)
      @subject = subject
      @recipients = recipient
      @from = 'no-reply@lovahs.com'
      @sent_on = sent_at
      @body["link"] = link
      @headers = {}
  end
  
  def share_letter(recipient, subject, link, message, name, content, sent_at = Time.now)
      @subject = "A Love Letter from " + name + " was sent to you"
      @recipients = recipient
      @from = 'no-reply@lovahs.com'
      @sent_on = sent_at
      @body["link"] = link
      @body["message"] = message
      @body["name"] = name
      @body["content"] = content
      @headers = {}
  end
  
  def verification_instructions(user)
      @subject = "Email Verification"
      @recipients = user.email
      @from = 'no-reply@lovahs.com'
      @sent_on = Time.now
      @body["verification_url"] = "http://www.lovahs.com/user_verifications/show/" + user.perishable_token
      @headers = {}
  end

end
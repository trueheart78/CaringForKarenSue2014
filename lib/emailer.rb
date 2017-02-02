require 'sparkpost'

class Emailer

  def self.send_admin_email(contact)
    Sparkpost.new(admin_email_content, contact).send
  end

  def self.send_user_email(contact)
    Sparkpost.new(user_email_content, contact).send
  end

  private

  def self.admin_email_content
    'caring-for-karen-sue-admin-email'
  end

  def self.user_email_content
    'caring-for-karen-sue-user-email'
  end
end

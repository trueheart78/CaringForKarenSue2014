require 'sparkpost'

class Emailer
  attr_reader :customer_name, :customer_email, :checkout, :value

  ADMIN_NAME  = 'Dave Danielson'
  ADMIN_EMAIL = 'daveydan21@yahoo.com'

  def initialize(params)
    @customer_name = params[:name]
    @customer_email = params[:email]
    @checkout = params[:checkout]
    @value = params[:value]
  end

  def send_admin_email
    # create an admin contact but with user details?
    self.deliver_email(admin_contact, 'New User Registration', admin_email_content)
  end

  def send_user_email
    # create a standard contact with user details
    self.deliver_email(customer_contact, 'Your Registration Details', user_email_content)
  end

  def to_s
    "Sending to #{customer_name} [#{customer_email}] for #{checkout} - #{value}"
  end

  private

  def deliver_email(contact, subject, message)
    sp = SparkPost::Client.new() # api key was set in ENV through ENV['SPARKPOST_API_KEY']
    response = sp.transmission.send_message(contact, SYSTEM_EMAIL, subject, message)
    response['total_accepted_recipients'] > 0
  end

  def admin_name
    return ADMIN_NAME unless ENV.has_key? 'ADMIN_NAME' && !ENV['ADMIN_NAME'].empty?
    ENV['ADMIN_NAME']
  end

  def admin_email
    return ADMIN_EMAIL unless ENV.has_key? 'ADMIN_EMAIL' && !ENV['ADMIN_EMAIL'].empty?
    ENV['ADMIN_EMAIL']
  end

  def customer_contact
    "#{@send_to_name} <#{@send_to_email}>"
  end

  def admin_contact
    "#{admin_name} <#{admin_email}>"
  end

  def admin_email_content
    'caring-for-karen-sue-admin-email'
  end

  def user_email_content
    'caring-for-karen-sue-user-email'
  end
end

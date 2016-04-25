class Emailer
  attr_reader :customer_name, :customer_email, :checkout, :value

  ADMIN_NAME  = 'Dave Danielson'
  ADMIN_EMAIL = 'daveydan21@yahoo.com'
  SYSTEM_EMAIL = 'CaringForKarenSue <no-reply@caringforkarensue.com>'

  def initialize(params)
    @customer_name = params[:name]
    @customer_email = params[:email]
    @checkout = params[:checkout]
    @value = params[:value]
  end

  def deliver_email(contact, subject, message)
    sp = SparkPost::Client.new() # api key was set in ENV through ENV['SPARKPOST_API_KEY']
    response = sp.transmission.send_message(contact, SYSTEM_EMAIL, subject, message)
    response['total_accepted_recipients'] > 0
  end

  def send_admin_email
    self.deliver_email(admin_contact, 'New User Registration', admin_email_content)
  end

  def send_user_email
    self.deliver_email(customer_contact, 'Your Registration Details', user_email_content)
  end

  def to_s
    "Sending to #{customer_name} [#{customer_email}] for #{checkout} - #{value}"
  end

  private

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
    "<div style='font-family:Arial;font-size:10pt;'>"+
    "You have received a registration for the CaringForKarenSue.com 6th Annual Golf Classic<br>"+
    "<br>"+
    "Name: #{customer_name}<br>"+
    "Email: #{customer_email}<br>"+
    "Paying By: #{checkout}<br>"+
    "Selected: #{value}<br>"+
    "</div>"
  end

  def user_email_content
    "<div style='font-family:Arial;font-size:10pt;'>"+
    "You have registered for the CaringForKarenSue.com 6th Annual Golf Classic<br>"+
    "<br>"+
    "Name: #{customer_name}<br>"+
    "Email: #{customer_email}<br>"+
    "Paying By: #{checkout}<br>"+
    "Selected: #{value}<br>"+
    "<br>"+
    "Please send a check or money order for the above amount to:<br>"+
    "<blockquote>1st Bank<br>"+
    "PO Box 507<br>"+
    "Arvada, CO 80001"+
    "</blockquote>"+
    "<i>Make your check or money order payable to:</i> Karen Sue Benefit Fund<br>"+
    "<br>"+
    "The deadline for your check is September 1, 2016"+
    "</div>"
  end
end

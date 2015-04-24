require 'mandrill'

class Emailer
  attr_reader :name, :email, :checkout, :value
  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @checkout = params[:checkout]
    @value = params[:value]
  end
  def to_s
    "Sending to #{@name} [#{@email}] for #{@checkout} - #{@value}"
  end
  def admin_name
    if !ENV['ADMIN_NAME'].nil? && !ENV['ADMIN_NAME'].empty?
      ENV['ADMIN_NAME']
    else
      "Dave Danielson"
    end
  end
  def admin_email
    if !ENV['ADMIN_EMAIL'].nil? && !ENV['ADMIN_EMAIL'].empty?
      ENV['ADMIN_EMAIL']
    else
      "daveydan21@yahoo.com"
    end
  end
  def sendAdminEmail
    return unless mandrill_api_key
    @subject = 'New User Registration'
    @sendToName = admin_name
    @sendToEmail = admin_email
    self.composeAdminEmail
    self.sendEmail
  end
  def sendUserEmail
    return unless mandrill_api_key
    @subject = 'Your Registration Details'
    @sendToName = @name
    @sendToEmail = @email
    self.composeUserEmail
    self.sendEmail
  end
  def mandrill_api_key
    ENV['MANDRILL_API_KEY']
  end
  def sendEmail
    m = Mandrill::API.new(mandrill_api_key)
    message = {
			:subject=> @subject,  
			:from_name=> "CaringForKarenSue",
			:text=> @messageText,  
			:to=> [  
			 {  
			   :email=> @sendToEmail,  
			   :name=> @sendToName  
			 }  
			],
			:bcc=> [
			{
				:email=> "josh@trueheart78.com",
				:name=> "Josh Mills (CFKS Admin)"
			}
			],
			:html=>@messageHTML,
			:from_email=>"auto@caringforkarensue.com"
    }
    sent = m.messages.send message
    puts sent
  end
  def composeAdminEmail
    @messageText =  "You have received a registration for the CaringForKarenSue.com 6th Annual Golf Classic\n"+
    "\n"+
    "Name: #{@name}\n"+
    "Email: #{@email}\n"+
    "Paying By: #{@checkout}\n"+
    "Selected: #{@value}"

    @messageHTML = "<div style='font-family:Arial;font-size:10pt;'>"+
    "You have received a registration for the CaringForKarenSue.com 6th Annual Golf Classic<br>"+
    "<br>"+
    "Name: #{@name}<br>"+
    "Email: #{@email}<br>"+
    "Paying By: #{@checkout}<br>"+
    "Selected: #{@value}<br>"+
    "</div>"
  end
  def composeUserEmail
    @messageText =  "You have registered for the CaringForKarenSue.com 6th Annual Golf Classic\n"+
    "\n"+
    "Name: #{@name}\n"+
    "Email: #{@email}\n"+
    "Paying By: #{@checkout}\n"+
    "Selected: #{@value}"+
    "\n"+
		"Please send a check or money order for the above amount to:\n"+
    "1st Bank\n"+
    "PO Box 507\n"+
    "Arvada, CO 80001\n"+
    "\n"+
    "Make your check or money order payable to:</i> Karen Sue Benefit Fund\n"+
    "\n"+
    "The deadline for your check is September 1, 2015"

    @messageHTML = "<div style='font-family:Arial;font-size:10pt;'>"+
    "You have registered for the CaringForKarenSue.com 6th Annual Golf Classic<br>"+
    "<br>"+
    "Name: #{@name}<br>"+
    "Email: #{@email}<br>"+
    "Paying By: #{@checkout}<br>"+
    "Selected: #{@value}<br>"+
    "<br>"+
		"Please send a check or money order for the above amount to:<br>"+
    "<blockquote>1st Bank<br>"+
    "PO Box 507<br>"+
    "Arvada, CO 80001"+
    "</blockquote>"+
    "<i>Make your check or money order payable to:</i> Karen Sue Benefit Fund<br>"+
    "<br>"+
    "The deadline for your check is September 1, 2015"+
    "</div>"
  end
end

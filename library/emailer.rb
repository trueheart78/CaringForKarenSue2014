require 'mandrill'

class Emailer
  attr_reader :name, :email, :type
  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @type = params[:type]
  end
  def to_s
    "Sending to #{@name} [#{@email}] for #{@type}"
  end
  def loadAdminEmail
    @fromEmail = ENV['ADMIN_EMAIL']
    @message = 'A user has registered'
    @subject = 'New User Registration'
  end
  def loadUserEmail
    @fromEmail = ENV['ADMIN_EMAIL']
    @message = 'You have been registered'
    @subject = 'Your Registration'
  end
  def sendAdminEmail
    self.loadAdminEmail
    self.sendEmail
  end
  def sendUserEmail
    self.loadUserEmail
    self.sendEmail
  end
  def sendEmail
    unless @message.empty? 
      m = Mandrill::API.new ENV['MANDRILL_API_KEY']
      message = {
				:subject=> @subject,  
				:from_name=> "CaringForKarenSue.com",
				:text=> @message,  
				:to=> [  
				 {  
				   :email=> @email,  
				   :name=> @name  
				 }  
				],  
				#:html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
				:from_email=>@fromEmail
      }
      #sending = m.messages.send message
      #{"email"=>"josh@trueheart78.com", "status"=>"sent", "_id"=>"5a8936b2ea8e4cacb08887af81a167f9", "reject_reason"=>nil}
      #puts "#{sending}"
      rendered = m.templates.render 'caring-registration-admin', [{:name => 'main', :content => 'The main content block'}]
      puts rendered['html'] # print out the rendered HTML
    end
  end
end

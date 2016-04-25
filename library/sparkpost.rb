require 'uri'
require 'net/http'
require 'json'

class Sparkpost

  def initialize(template_id, contact)
    @template_id = template_id
    @contacts = []
    add_contact(contact)
  end

  def send
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    response = https.post(uri.path, payload, headers)
    response.code == '200'
  end

  private

  def uri
    URI('https://api.sparkpost.com/api/v1/transmissions')
  end

  def payload
    {
      recipients: recipients,
      content: content,
      substitution_data: substitution_data
    }.to_json
  end

  def headers
    {
      'Content-type': 'application/json',
      'Authorization': ENV['SPARKPOST_API_KEY']
    }
  end

  def add_contact(contact)
    @contacts << { address: contact.address,
                   substitution_data: { customer_email: contact.email,
                                        customer_name: contact.name,
                                        payment_type: contact.payment_type,
                                        total_cost: contact.total_cost }
    }
  end

  def recipients
    #will have substitution data for: customer_name, customer_email, checkout, value
    @contacts
  end

  def substitution_data
    #puts details here for the 'event_iteration' and 'deadline_for_checks'
  end

  def content
    { template_id: template_id }
  end

  def template_id
    @template_id
  end
end

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
                                        selected_item: contact.selected_item }
    }
  end

  def recipients
    @contacts
  end

  def substitution_data
    {
      event_iteration: '7th',
      deadline_for_checks: 'September 1st, 2016'
    }
  end

  def content
    { template_id: template_id }
  end

  def template_id
    @template_id
  end
end

require 'uri'
require 'net/http'
require 'json'

class Sparkpost

  def initialize(template_id, replacement_data = {})
    @template_id = template_id
    @recipients = []
  end

  def add_recipient(recipient)

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

  def recipients

  end

  def substitution_data

  end

  def content
    { template_id: template_id }
  end

  def template_id
    @template_id
  end
end

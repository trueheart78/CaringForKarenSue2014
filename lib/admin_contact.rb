class AdminContact
  attr_reader :name, :email, :payment_type, :selected_item

  ADMIN_ADDRESS = 'Dave Danielson <daveydan21@yahoo.com>'

  def initialize(name, email, payment_type, selected_item)
    @name = name
    @email = email
    @payment_type = payment_type
    @selected_item = selected_item
  end

  def address
    return ADMIN_ADDRESS unless ENV.has_key?('ADMIN_ADDRESS') && !ENV['ADMIN_ADDRESS'].empty?
    ENV['ADMIN_ADDRESS']
  end
end

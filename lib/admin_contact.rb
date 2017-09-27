class AdminContact
  attr_reader :name, :email, :payment_type, :selected_item

  ADMIN_NAME = 'Josh (Admin)'
  ADMIN_EMAIL = 'josh@trueheart78.com'

  def initialize(name, email, payment_type, selected_item)
    @name = name
    @email = email
    @payment_type = payment_type
    @selected_item = selected_item
  end

  def address
    { name: admin_name, email: admin_email }
  end

  def payment_by_check?
    payment_type.downcase == 'check'
  end

  private

  def admin_name
    return ADMIN_NAME unless ENV.has_key?('ADMIN_NAME') && !ENV['ADMIN_NAME'].empty?
    ENV['ADMIN_NAME']
  end

  def admin_email
    return ADMIN_EMAIL unless ENV.has_key?('ADMIN_EMAIL') && !ENV['ADMIN_EMAIL'].empty?
    ENV['ADMIN_EMAIL']
  end
end

class Contact
  attr_reader :name, :email, :payment_type, :selected_item

  def initialize(name, email, payment_type, selected_item)
    @name = name
    @email = email
    @payment_type = payment_type
    @selected_item = selected_item
  end

  def address
    { name: name, email: email }
  end

  def payment_by_check?
    payment_type.downcase == 'check'
  end
end

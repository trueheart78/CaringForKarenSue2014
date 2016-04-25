class Contact
  attr_reader :name, :email, :payment_type, :total_cost

  def initialize(name, email, payment_type, total_cost)
    @name = name
    @email = email
    @payment_type = payment_type
    @total_cost = total_cost
  end

  def address
    "#{name} <#{email}>"
  end
end

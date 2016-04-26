class Module
  include Minitest::Spec::DSL
end

module ContactRolePublicInterfaceTest
  def test_responds_to_name
    assert_respond_to contact, :name
  end

  def test_responds_to_email
    assert_respond_to contact, :email
  end

  def test_responds_to_payment_type
    assert_respond_to contact, :payment_type
  end

  def test_responds_to_selected_item
    assert_respond_to contact, :selected_item
  end

  def test_responds_to_address
    assert_respond_to contact, :address
  end

  def test_responds_to_payment_by_check?
    assert_respond_to contact, :payment_by_check?
  end

  let(:customer_name)  { 'test' }
  let(:customer_email) { 'test@test.com' }
  let(:payment_type)   { 'PayPal' }
  let(:selected_item)  { '1 Player $100' }
end

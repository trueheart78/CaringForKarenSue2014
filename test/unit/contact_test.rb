require_relative '../test_helper'
require 'contact'

describe Contact do
  let(:contact) { Contact.new(customer_name, customer_email, payment_type, selected_item) }
  let(:customer_name)    { 'test' }
  let(:customer_email)   { 'test@test.com' }
  let(:payment_type)     { 'PayPal' }
  let(:selected_item)    { 'Registration $100' }

  describe 'public interface' do
    it 'behaves like a contact' do
      assert contact.respond_to? :name
      assert contact.respond_to? :email
      assert contact.respond_to? :payment_type
      assert contact.respond_to? :selected_item
      assert contact.respond_to? :address
      assert contact.respond_to? :payment_by_check?
    end
  end

  describe '#address' do
    context 'with a name and email' do
      let(:expected_address) do
        { name: customer_name, email: customer_email }
      end

      it 'provides a valid address' do
        assert_equal contact.address, expected_address
      end
    end
  end

  describe '#payment_by_check?' do
    context 'with a payment_type of CHECK' do
      let(:payment_type) { 'CHECK' }

      it 'is true' do
        assert contact.payment_by_check?
      end
    end

    context 'with a payment_type of PayPal' do
      let(:payment_type) { 'PayPal' }

      it 'is false' do
        refute contact.payment_by_check?
      end
    end
  end
end

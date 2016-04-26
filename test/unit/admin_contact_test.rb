require_relative '../test_helper'
require 'admin_contact'

describe AdminContact do
  let(:contact) { AdminContact.new(customer_name, customer_email, payment_type, selected_item) }
  let(:customer_name)    { 'test' }
  let(:customer_email)   { 'test@test.com' }
  let(:payment_type)     { 'check' }
  let(:selected_item)    { 'Registration $100' }

  describe 'public interface' do
    it 'behaves like a contact' do
      assert contact.respond_to? :name
      assert contact.respond_to? :email
      assert contact.respond_to? :payment_type
      assert contact.respond_to? :selected_item
      assert contact.respond_to? :address
    end
  end

  describe '#address' do
    context 'with a name and email' do
      let(:expected_address) { ENV['ADMIN_ADDRESS'] }

      it 'provides a valid address' do
        assert_equal contact.address, expected_address
      end
    end
  end
end

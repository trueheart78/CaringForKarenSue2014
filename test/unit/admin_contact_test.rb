require_relative '../test_helper'
require_relative 'contact_role_shared'
require 'admin_contact'

describe AdminContact do
  include ContactRolePublicInterfaceTest

  let(:contact) { AdminContact.new(customer_name, customer_email, payment_type, selected_item) }

  describe '#address' do
    context 'with an environment provided name and email' do
      let(:expected_address) do
        { name: ENV['ADMIN_NAME'], email: ENV['ADMIN_EMAIL'] }
      end

      it 'provides the valid admin address' do
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

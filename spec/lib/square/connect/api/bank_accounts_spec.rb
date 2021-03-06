require 'spec_helper'

describe Square::Connect::API::BankAccounts do
  let(:client) { Square::Connect::Client.new }
  let(:path) { 'v1/me/bank-accounts/1' }
  let(:headers) { { content_type: 'application/json; charset=utf-8' } }
  describe '#bank_account' do
    subject { client.bank_account(1) }

    before do
      stub_get(:connect, path).to_return(
        body: fixture('bank_account.json'),
        headers: headers
      )
    end
    after { WebMock.reset! }

    it 'requests the correct resource' do
      is_expected.to be_instance_of(Square::Connect::BankAccount)
      expect(assert_request_requested a_get(:connect, 'v1/me/bank-accounts/1')).to be_nil
    end
  end
end

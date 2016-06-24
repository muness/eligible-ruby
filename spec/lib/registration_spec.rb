describe Eligible::Registration do
  let(:params) { { test: true } }
  let(:api_key) { 'xyz' }
  let(:response) { { success: true } }
  before(:each) do
    allow(Eligible::Util).to receive(:convert_to_eligible_object).with(response, api_key).and_return('success')
  end

  describe '.post' do
    it 'should post to Eligible.request with proper url' do
      allow(Eligible).to receive(:request).with(:post, '/registrations.json', api_key, params).and_return([response, api_key])
      expect(Eligible::Registration.post(params, api_key)).to eq 'success'
    end
  end
end

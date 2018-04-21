RSpec.describe API::V1::Test, :api do

  describe 'GET /v1/test' do
    it 'returns test response' do
      call_api
      expected = JSON.dump({status: :ok})
      expect(last_response.body).to eq(expected)
    end
  end

end
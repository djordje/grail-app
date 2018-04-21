RSpec.describe API::V1, type: :api do

  describe 'GET /v1/health' do
    it 'returns test response' do
      call_api
      expected = JSON.dump(status: :healthy)
      expect(last_response.body).to eq(expected)
    end
  end

end
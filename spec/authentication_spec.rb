require 'rails_helper'
require 'faker'
require 'factory_bot_rails'
require 'devise'

def decoded_jwt_token_from_response(response)
  token_from_request = response.headers['Authorization'].split(' ').last
  JWT.decode(token_from_request, ENV['c6977142e3d968eb45a955b89b095f55cc8e2640e159682d6a49bfe3c0c2a937a6f4420a181e962dd0cb64233b93756ad34fd6dc8a311d2045b5c06bcbc828e6'], true)
end

RSpec.describe 'GET /users/sign_in', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      decoded_token = decoded_jwt_token_from_response(response)
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
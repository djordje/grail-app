# frozen_string_literal: true

class API::V1::Test < Grape::API
  resources :test do
    desc 'Test API endpoint'
    get do
      { status: :ok }
    end
  end
end

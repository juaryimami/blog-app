require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before { get '/users' }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('This page shows all Users')
    end
  end

  describe 'GET /show' do
    before { get '/users/2' }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('This page show one User')
    end
  end
end

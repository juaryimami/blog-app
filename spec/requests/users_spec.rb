require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/2/posts' }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('This page show all posts for a User')
    end
  end

  describe 'GET /show' do
    before { get '/users/2/posts/45' }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('This page shows a post for a certain user')
    end
  end
end

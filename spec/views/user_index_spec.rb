require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'user index page' do
    before :all do
      user = User.new(
        email: 'juharyimer&@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      user.skip_confirmation!
      user.save!

      Post.create(
        id: 1,
        author_id: 1,
        title: "Christian' Post",
        text: 'Christian was here. The Christian',
        comments_counter: 0,
        likes_counter: 0
      )
    end

    it 'users_path show name of users' do
      visit users_path
      expect(page).to have_content('Admin')
    end

    it "users_path show an user's picture" do
      visit users_path
      expect(page).to have_css('img', class: 'img_profile')
    end

    it "users_path show the correct user's post_counter" do
      visit users_path
      expect(page).to have_content('1')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit users_path
      click_link('See profile')
      expect(page).to have_current_path(user_path(1))
    end
  end
end

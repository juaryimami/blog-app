require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'post index page' do
    before :all do
      user = User.new(
        email: 'admin@gmail.com',
        bio: 'Lorenzo is my partner',
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
        title: "Lorenzo' Post 1",
        text: 'Lorenzo was here. The Lorenzo 1',
        comment_counter: 0,
        like_counter: 0
      )

      Comment.create(
        author_id: 1,
        post_id: 1,
        text: 'Capybaras are cool'
      )

      Comment.create(
        author_id: 1,
        post_id: 1,
        text: 'Capybaras are bad'
      )
    end

    it "user_posts_path show an user's picture" do
      visit user_posts_path(1)
      expect(page).to have_css('img', class: 'img_profile')
    end

    it 'user_posts_path show name of users' do
      visit user_posts_path(1)
      expect(page).to have_content('Admin')
    end

    it "user_posts_path show the correct user's post_counter" do
      visit user_posts_path(1)
      expect(page).to have_content('1')
    end

    it 'user_posts_path shows the recent posts' do
      visit user_posts_path(1)
      expect(page).to have_content("Lorenzo' Post 1")
    end

    it 'user_posts_path shows the comments' do
      visit user_posts_path(1)
      expect(page).to have_content('Capybaras are cool')
      expect(page).to have_content('Capybaras are bad')
    end

    it 'user_posts_path shows the comments counter' do
      visit user_posts_path(1)
      expect(page).to have_content('2')
    end

    it 'user_posts_path shows the likes counter' do
      visit user_posts_path(1)
      expect(page).to have_content('0')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit user_posts_path(1)
      click_link("Lorenzo' Post 1")
      expect(page).to have_current_path(user_post_path(1, 1))
    end
  end
end

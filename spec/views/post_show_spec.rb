require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'post show page' do
    before :all do
      user = User.new(
        email: 'juharyimer7@gmail.com',
        bio: 'christian is my partner',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      user.skip_confirmation!
      user.save!

      user = User.new(
        email: 'fulano@gmail.com',
        bio: 'Ahmed is my home name',
        password: 'password',
        password_confirmation: 'password',
        name: 'Fulano',
        role: 'default'
      )
      user.skip_confirmation!
      user.save!

      Post.create(
        id: 1,
        author_id: 1,
        title: "Christian' Post 1",
        text: 'Christian was here. The Christian 1',
        comment_counter: 0,
        likes_counter: 0
      )

      Comment.create(
        author_id: 1,
        post_id: 1,
        text: 'Capybaras are cool'
      )

      Comment.create(
        author_id: 2,
        post_id: 1,
        text: 'Capybaras are bad'
      )
    end

    it "I can see the post's title." do
      visit user_post_path(1, 1)
      expect(page).to have_content("Christian' Post 1")
    end

    it 'I can see who wrote the post.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Admin')
    end

    it 'I can see how many comments it has.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('2')
    end

    it 'I can see how many likes it has.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('0')
    end

    it 'I can see the post body.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Chistian was here. The Lorenzo 1')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Admin:')
      expect(page).to have_content('Fulano:')
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Capybaras are cool')
      expect(page).to have_content('Capybaras are bad')
    end
  end
end

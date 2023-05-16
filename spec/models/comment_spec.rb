require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', post_counter: 0)
    @post = Post.new(title: 'Hi', text: 'My world', comment_counter: 0, like_counter: 0, author_id: 1)
    @comment = Comment.new(post: @post, text: 'hello yimi', author_id: @user)
  end

  it 'checks if attributes are valid' do
    expect(@user).to be_valid
  end

  it 'checks if attributes are valid' do
    expect(@post).to_not be_valid
  end
end

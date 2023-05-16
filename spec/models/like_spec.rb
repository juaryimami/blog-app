require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Alex', photo: 'Photo', bio: 'I am a Front-end developer')
    @post = @user.posts.create(title: 'I am a title', text: 'I am a text', author_id: @user.id)
    @like = @post.likes.create(author_id: @user.id, post_id: @post.id)
  end

  it 'likesCounter should return 1 like' do
    expect(@post.likes_counter).to be(1)
  end
end

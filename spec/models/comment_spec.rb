require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Alex', photo: 'Photo', bio: 'I am a Front-end developer')
    @post = @user.posts.create(title: 'I am a title', text: 'I am a text', author_id: @user.id)
    @comment = @post.comments.create(text: 'Lorenzo was here', author_id: @user.id, post_id: @post.id)
  end

  it 'commentsCounter should return 1 like' do
    expect(@post.comments_counter).to be(1)
  end
end

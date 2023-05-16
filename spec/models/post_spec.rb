require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Alex', photo: 'Photo', bio: 'I am a Front-end developer')
    @post = @user.posts.new(title: 'I am a title', text: 'I am a text')
    @post.author_id = @user.id
    @post.save
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'title should not be greater than 250 characters' do
    @post.title = Faker::Lorem.characters(number: 300)
    expect(@post).to_not be_valid
  end

  it 'commentsCounter should be a integer greater or equal to 0' do
    @post.comment_counter = nil
    expect(@post).to_not be_valid
  end

  it 'likesCounter should be a integer greater or equal to 0' do
    @post.like_counter = nil
    expect(@post).to_not be_valid
  end

  it 'recentComments should be return 5 comments' do
    (1..8).each do |_id|
      Comment.create(
        author_id: 1,
        post_id: @post.id,
        text: 'This is a comment'
      )
    end
    expect(@post.recent_comments.length).to be(0)
  end

  it 'PostsCounter should return 1 post' do
    expect(@user.posts.length).to be(1)
  end
end

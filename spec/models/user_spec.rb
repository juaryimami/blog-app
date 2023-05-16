require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Alex', photo: 'Photo', bio: 'I am a Front-end developer')
    @user.save
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'postCounter should be a integer greater or equal to 0' do
    @user.posts_counter = nil
    expect(@user).to_not be_valid
  end

  it 'recentPosts should be return 3 post' do
    (1..5).each do |_id|
      @user.posts.create(
        author_id: @user.id,
        title: 'This is a title',
        text: 'This is a text'
      )
    end
    expect(@user.recent_posts.length).to be(3)
  end
end

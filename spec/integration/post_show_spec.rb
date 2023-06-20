require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 3
    )
    @post = Post.create(
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0,
      author_id: @tom.id
    )
    Comment.create(
      post: @post,
      author: @tom,
      text: 'Hi Tom!',
      post_id: @post.id,
      author_id: @tom.id
    )
    visit user_post_path(@tom.id, @post.id)
  end
  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end
  it 'shows the writer of the post' do
    expect(page).to have_content("by #{@tom.name}")
  end
  it 'shows the number of comments for the post' do
    expect(page).to have_content('Comments: 1')
  end
  it 'shows the number of likes for the post' do
    expect(page).to have_content('Likes: 0')
  end
  it 'shows the body of the post' do
    expect(page).to have_content('This is my first post')
  end
  it 'shows the username of each commentor' do
    expect(page).to have_content(@tom.name)
  end
  it 'shows comment of each commentor' do
    expect(page).to have_content('Hi Tom!')
  end
end

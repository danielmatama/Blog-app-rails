require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :feature do
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
    visit user_posts_path(@tom.id)
  end
  it 'show users profile picture' do
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
    and @alt='user photo']")
  end
  it 'shows users username' do
    expect(page).to have_content(@tom.name)
  end
  it 'shows users posts number' do
    expect(page).to have_content('Number of posts: 4')
  end
  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end
  it 'shows the post text' do
    expect(page).to have_content('This is my first post')
  end
  it 'shows first comments on a post' do
    expect(page).to have_content('Hi Tom!')
  end
  it 'shows number of comments for a post' do
    expect(page).to have_content('Comments: 1')
  end
  it 'shows number of likes for a post' do
    expect(page).to have_content('Likes: 0')
  end
  it 'shows section for pagination' do
    expect(page).to have_content('Add new Post')
  end
  it 'redirects to posts show page' do
    click_on 'Hello'
    expect(page).to have_current_path user_post_path(@tom.id, @post.id)
  end
end

require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 3
    )
    @lilly = User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Poland.',
      posts_counter: 0
    )
    visit root_path
  end

  it 'shows username of users' do
    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@lilly.name)
  end

  it 'shows the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
     and @alt='user photo']")
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
     and @alt = 'user photo']")
  end

  it 'shows the users posts' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'redirects to users show page' do
    click_on 'Tom'
    expect(page).to have_current_path user_path(@tom)
    expect(page).to have_content('Teacher from Mexico.')
  end
end

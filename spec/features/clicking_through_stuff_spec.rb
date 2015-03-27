require 'rails_helper'

describe 'clicking functionality through site' do
  it 'will allow user to add new post' do
    visit root_path
    click_on "Write post"
    fill_in 'Title', :with => 'This title'
    fill_in 'Body', :with => 'This content'
    click_on 'Create Post'
    expect(page).to have_content "Your post has been added!"
  end

  it 'will allow user to go back from individual posts' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Return to posts"
    expect(page).to have_content "How About a Journal Blog?"
  end
end

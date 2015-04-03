require 'rails_helper'

describe "user editing functionality" do
  let (:user) {FactoryGirl.create(:user)}
  let (:post) {FactoryGirl.create(:post, :user_id => user.id)}

  it 'will allow user to edit a post' do
    user
    post
    sign_in(user)
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', :with => "New Title"
    click_on 'Update Post'
    expect(page).to have_content "Your post has been updated!"
  end

  it 'will allow user to delete a post' do
    user
    post
    sign_in(user)
    visit post_path(post)
    click_on 'Delete Post'
    expect(page).to have_content "Your post has been deleted!"
  end
end

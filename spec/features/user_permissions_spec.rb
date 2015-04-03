require 'rails_helper'

describe "User Permissions" do
  let (:user) {FactoryGirl.create(:user)}
  let (:another_user) {FactoryGirl.create(:user)}
  let (:post) {FactoryGirl.create(:post)}
  let (:comment) {FactoryGirl.create(:comment)}

  it 'will only allow a user signed in to comment on a post' do
    post
    user
    visit post_path(post)
    expect(page).to have_content 'Sign in to comment'
  end

  it 'will only allow the author of a post to edit or delete' do
    another_user
    post
    user
    sign_in(another_user)
    visit post_path(post)
    expect(page).to have_no_content "Edit Post"
    expect(page).to have_no_content "Delete Post"
  end
end

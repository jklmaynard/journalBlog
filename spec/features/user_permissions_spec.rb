require 'rails_helper'

describe "User Permissions" do
  let (:user) {FactoryGirl.create(:user)}
  let (:another_user) {FactoryGirl.create(:user)}
  let (:post) {FactoryGirl.create(:post, :user_id => user.id)}
  let (:comment) {FactoryGirl.create(:comment, :user_id => another_user.id)}

  it 'will only allow a user signed in to comment on a post' do
    post
    user
    visit post_path(post)
    expect(page).to have_content 'Sign in to comment'
  end

  it 'will only allow an owner of a comment to edit that comment' do
    another_user
    comment
    post
    user
    sign_in(another_user)
    visit post_path(post)
    add_comment(comment)
    expect(page).to have_content "Edit Comment"
    expect(page).to have_no_content "Edit Post"
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

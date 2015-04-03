require 'rails_helper'

describe 'Comment functionality' do
  let (:post) {FactoryGirl.create(:post)}
  let (:comment) {FactoryGirl.create(:comment)}

  it 'will allow a user to add a comment to a post' do
    post
    visit post_path(post)
    click_on "Add Comment"
    fill_in "Body", :with => "Some comment"
    click_on "Create Comment"
    expect(page).to have_content "Your comment is posted!"
  end

  it 'will allow a user to edit a comment to a post' do
    post
    comment
    visit post_path(post)
    click_on "Add Comment"
    add_comment(comment)
    click_on "Edit"
    fill_in "Body", :with => "A nice remark"
    click_on "Update Comment"
    expect(page).to have_content "Comment updated"
  end

  it 'will allow a user to delete a comment to a post' do
    post
    comment
    visit post_path(post)
    click_on "Add Comment"
    add_comment(comment)
    click_on "Delete"
    expect(page).to have_no_content comment.body
  end

end

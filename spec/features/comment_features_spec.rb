require 'rails_helper'

describe 'Comment functionality' do
  it 'will allow a user to add a comment to a post' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Add comment"
    fill_in "Body", :with => "Some comment"
    click_on "Create Comment"
    expect(page).to have_content "Your comment is posted!"
  end
end

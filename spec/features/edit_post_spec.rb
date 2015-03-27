require 'rails_helper'

describe "user editing functionality" do
  it 'will allow user to edit a post' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => "New Title"
    click_on 'Update Post'
    expect(page).to have_content "Your post has been updated!"
  end

  it 'will allow user to delete a post' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content "Your post has been deleted!"
  end
end

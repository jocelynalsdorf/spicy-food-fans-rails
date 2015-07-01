require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Add a New Post'
    fill_in 'Title', :with => 'nachos'
    fill_in 'Content', :with => 'hot stuff'
    fill_in 'Author', :with => 'rocket'
    click_on 'Create Post'
    expect(page).to have_content 'Posts'
  end
  it "gives an error when no data is entered into form fields" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end

end

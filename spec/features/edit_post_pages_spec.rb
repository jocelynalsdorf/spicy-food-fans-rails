require 'rails_helper'

describe "the edit post process" do

  it "updates a post" do
    visit posts_path
    click_on 'Add a New Post'
    fill_in 'Title', :with => 'Tamales'
    fill_in 'Content', :with => ' Very spicy tamales'
    fill_in 'Author', :with => 'Raven'
    click_on 'Create Post'
    click_on 'Tamales'
    click_on 'Edit Post'
    fill_in 'Title', :with => 'Enchiladas'
    click_on 'Update Post'
    expect(page).to have_content 'Enchiladas'
  end

  it "gives an error when no data is entered into form fields" do
    test_post = Post.create(:title => "Enchiladas", :content => 'very spicy', :author => "Nimue")
    visit edit_post_path(test_post)
    fill_in 'Title', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end
end

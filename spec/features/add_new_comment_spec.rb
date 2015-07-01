require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    test_post = Post.create(:title => "Post One", :content => 'blah', :author => 'blah blah')

    visit post_path(test_post)
    click_on 'Add a New Comment'
    fill_in 'Text', :with => 'Ruby'
    fill_in 'Rating', :with => 5
    fill_in 'User', :with => 'Me'
    click_on 'Create Comment'
    expect(page).to have_content 'Comments'

  end

  it "gives an error when no data is entered into form fields" do
    test_post = Post.create(:title => "Post One", :content => 'blah', :author => 'blah blah')
    visit post_path(test_post)
    click_on 'Add a New Comment'
    fill_in 'Text', :with => ''
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end

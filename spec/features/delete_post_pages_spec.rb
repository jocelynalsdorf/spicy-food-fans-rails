require 'rails_helper'

describe 'the delete post process' do
  it 'deletes a post' do
    test_post = Post.create(:title => 'Spicy Cheese Burger', :content => 'yum', :author => 'Paul')
    visit post_path(test_post)
    click_link 'Delete'
    expect(page).to have_no_content 'Spicy Cheese Burger'
  end
end

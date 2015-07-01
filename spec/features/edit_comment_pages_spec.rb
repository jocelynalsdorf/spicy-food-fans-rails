require 'rails_helper'

describe "the edit comment process" do
  it "updates a comment" do
    test_post = Post.create(:title => "Java", :content => "blah blah", :author => 'me', id: 2)
    test_comment = Comment.create(:text => "text 1", :rating => 1, :user => 'me', :post_id => test_post.id)
    visit post_path(test_post, test_comment)
    # click_on 'Edit Comment'
    find('li', :text => 'text 1').click_link('Edit Comment')
    # find("button a[href='/posts/#{test_post.id}/comments/#{test_comment.id}']").click
    fill_in 'Text', :with => 'Rat'
    click_on 'Update Comment'
    expect(page).to have_content 'Rat'
  end

  it "gives an error when no data is entered into form fields" do
    test_post = Post.create(:title => "Java", :content => "blah blah", :author => 'me', id: 2)
    test_comment = Comment.create(:text => "text 1", :rating => 1, :user => 'me', :post_id => test_post.id)
    visit post_path(test_post, test_comment)
    find('li', :text => 'text 1').click_link('Edit Comment')
    fill_in 'Text', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content 'errors'
  end
end

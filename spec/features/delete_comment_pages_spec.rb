require 'rails_helper'

describe "the delete comment process" do
  it "deletes a comment" do
    test_post = Post.create(:title => "Carrot Cake", :content => "carrots", :author => "bob")
    test_comment = Comment.create(:text => "boot", :rating => 3, :user => "fred", :post_id => test_post.id)
    visit post_path(test_post,test_comment)
    find("button a[href='/posts/#{test_post.id}/comments/#{test_comment.id}']").click
    #click_on 'Delete Comment'
    expect(page).to have_no_content 'boot'
  end
end

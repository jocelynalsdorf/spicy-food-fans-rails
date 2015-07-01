class Comment < ActiveRecord::Base
  belongs_to :post
  validates :text, :presence => true
  validates :rating, :presence => true
  validates :user, :presence => true
end

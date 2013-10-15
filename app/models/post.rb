class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments

  default_scope includes(:comments)
end

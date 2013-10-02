class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments

  def as_json(options = {})
    super(options.merge({
      :include => :comments
    }))
  end
end

class CommentSerializer < ActiveModel::Serializer
  attributes :body, :post_id

  has_one :post
end

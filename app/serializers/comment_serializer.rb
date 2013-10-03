class CommentSerializer < ActiveModel::Serializer
  attributes :body, :post_id
end

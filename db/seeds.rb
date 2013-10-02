VALENCES = ["great", "good", "decent", "ok", "meh", "not great", "bad", "terrible"]


50.times do |n|
  p = Post.create!({
    :title => "Post number #{n}",
    :body => "Today was a #{ VALENCES.sample } day"
  })

  3.times do
    post.comments.build(:body => "This is a #{ VALENCES.sample } post")
  end
end



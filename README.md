#Testing Your API Using RSpec

First, we need to make sure we have rspec-rails installed.
```ruby
group :development, :test do
  gem 'rspec-rails'
end
```
`bundle install`
`rails generate rspec:install`

Now we have a spec directory, yay!

##Testing `#as_json`
If you're serving any sort of associated data with your JSON API, you're either overwriting `#as_json` in your model, using RABL, or using [ActiveModel::Serializer][thoughtbot-serializer]. This can easily be tested in your `model_spec.rb` file. Let's see how we can do that

```ruby
#spec/models/post_spec.rb

```

##Making a request to your API
So you're setting up your API and want to set up some test to make sure it is properly serving the JSON of the resources you want. We can begin by making simple requests and making sure that the response headers received are in the 200 range.

Let's start with a simple example testing Posts#index

```ruby
#app/controllers/posts/posts_controller.rb
class PostsController < ApplicationController
  respond_to :json
  
  def index
    @posts = Post.includes(:comments)
    respond_with  @posts
  end
end


#spec/controllers/posts_controller_spec.rb
describe PostsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, :format => 'json' # you must specify that you want the request to be in JSON
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
```


[thoughtbot-serializer]:http://robots.thoughtbot.com/post/36676073713/better-serialization-less-as-json

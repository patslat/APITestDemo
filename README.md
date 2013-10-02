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

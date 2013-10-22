#Testing Your API Using RSpec

First, we need to make sure we have rspec-rails installed  

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```  

```bash
bundle install
rails generate rspec:install
```

Now we have a spec directory, yay!

##Nested Resources
If you're serving any sort of associated data with your JSON API, you're either overwriting `#as_json` in your model, using RABL, or using [ActiveModel::Serializer][thoughtbot-serializer]. You probably want to make sure that this is working properly, so make sure that the response arrives with the nested resource details intact.

You'll often be doing something like this in most specs:
`json = JSON.parse(response.body)`

We can dry this up by using a helper method:

```ruby
#spec/support/request_helpers.rb
module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end

#include it in your config
#spec/spec_helper.rb
RSpec.configure do |config|
  config.include Requests::JsonHelpers
end
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

citations:
[Rails API Testing Best Practices][testing-best-practices]

[testing-best-practices]:http://matthewlehner.net/rails-api-testing-guidelines/
[thoughtbot-serializer]:http://robots.thoughtbot.com/post/36676073713/better-serialization-less-as-json

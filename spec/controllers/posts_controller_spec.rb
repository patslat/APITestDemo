require 'spec_helper.rb'

describe PostsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      post = FactoryGirl.create(:post)
      get :index, :format => 'json'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "serves posts with nested comments" do
      post_with_comments = FactoryGirl.create(:post_with_comments)
      get :index, :format => 'json'
      expect(response).to be_success
      body = JSON.parse(response.body)

      comments = body['posts'].first['comments']
      expect(comments.length).to eq(5)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      post = FactoryGirl.create(:post)
      get :show, :format => 'json'
      expect(response).to be_success
    end
  end

end

require 'spec_helper'

describe Api::V1::PostsController do

  describe "POST #create" do
    before :each do
      post_params = FactoryGirl.attributes_for(:post)
      post :create, :post => post_params, :format => 'json'
    end

    it "responds successfully with an HTTP 204 status code" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "creates post" do
     before_count = Post.count
     post :create, :post => {:title => "hi", :body => 'hi'}, :format => 'json'
     expect(Post.count).to be(before_count + 1)
    end
  end

  describe "DELETE #destroy" do
    let(:single_post) { FactoryGirl.create(:post) }

    it "responds successfully with an HTTP 204 status code" do
      single_post
      delete :destroy, :id => single_post
      expect(response).to be_success
      expect(response.status).to eq(204)
    end

    it "deletes post" do
      single_post
      expect {
        delete :destroy, :id => single_post
      }.to change(Post, :count).by(-1)
    end
  end

  describe "GET #index" do

    before :each do
      post_with_comments = FactoryGirl.create(:post_with_comments)
      get :index, :format => 'json'
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "serves posts with nested comments" do
      comments = json['posts'].first['comments']
      expect(comments.length).to eq(5)
    end
  end

  describe "GET #show" do

    before :each do
      post_with_comments = FactoryGirl.create(:post_with_comments)
      get :show, :id => post_with_comments.id, :format => 'json'
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "should include associated comments" do
      comments = json['posts'].first['comments']
      expect(comments.length).to eq(5)
    end
  end

  describe "PUT #update" do

    before :each do
      single_post = FactoryGirl.create(:post)

      updated_attributes = {
        :title => "what is it like to be a bat",
        :body => "can a human know?"
      }

      put :update,
          :id => single_post.id,
          :post => updated_attributes,
          :format => 'json'
    end

    it "responds successfully with an HTTP 204 status code" do
      expect(response).to be_success
      expect(response.status).to eq(204)
    end
  end

end

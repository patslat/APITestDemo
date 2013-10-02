require 'spec_helper'

FactoryGirl.define do
  factory :post do
    title "The cat is alive"
    body "The cat is dead"
  end
end

describe PostsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, :format => 'json'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end

end

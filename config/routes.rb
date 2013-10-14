APITestDemo::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, :shallow => true
      end
    end
  end
end

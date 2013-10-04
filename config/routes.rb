APITestDemo::Application.routes.draw do
  resources :posts do
    resources :comments, :only => [:create, :index, :new]
  end
  resources :comments, :except => [:create, :index, :new]
end

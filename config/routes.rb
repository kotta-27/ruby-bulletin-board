Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

  # これは，localhost:3000/posts その下に，posts/indexなどとなる
  resources :posts, only: [ :index, :new, :create, :edit, :update, :destroy ]
end

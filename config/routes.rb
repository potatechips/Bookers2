Rails.application.routes.draw do

  root "homes#top"
  get "home/about" => "homes#about"
  get '/search' => 'search#search', as: 'search'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create,:destroy]
  	 resource :favorites, only: [:create,:destroy]
  end

  resources :users, only:[:show,:edit,:update,:index,] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # get 'relationships/create'
  # get 'relationships/destroy'

end

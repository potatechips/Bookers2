Rails.application.routes.draw do
  root 'homes#top'
  get "home/about" => "homes#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only:[:show, :edit, :update, :index,:create]

end

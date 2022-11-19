Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  get 'users/index' => 'users#index', as: 'index'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'books/:id' => 'books#show', as: 'book'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit ]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

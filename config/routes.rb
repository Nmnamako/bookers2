Rails.application.routes.draw do
  devise_for :books
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :user, only: [:show, :show, :edit]
  resources :books, only: [:new, :create, :index, :show, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

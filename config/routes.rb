Rails.application.routes.draw do
  resources :books
  resources :copies
  resources :statuses
  root 'books#index'
end

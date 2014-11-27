Rails.application.routes.draw do
  resources :books do
    resources :statuses, only: [:new, :create]
  end
  resources :copies
  resources :statuses, only: [:index, :edit, :update, :destroy, :show]
  root 'books#index'
end

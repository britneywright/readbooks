Rails.application.routes.draw do
  resources :books do
    resources :copies, only: [:new, :create, :index]
    resources :statuses, path: 'reservation', only: [:new, :create, :index]
  end

  resources :copies, only: [:index, :edit, :update, :destroy, :show]
  resources :statuses, path: 'reservation', only: [:index, :edit, :update, :destroy, :show]
  root 'books#index'
end

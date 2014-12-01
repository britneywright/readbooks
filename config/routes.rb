Rails.application.routes.draw do
  resources :books do
    resources :copies, only: [:new, :create, :index]
    resources :statuses, path: 'reservation', only: [:new, :create, :index]
  end

  get 'books/:id/admin', to: 'books#admin'

  resources :copies, only: [:index, :edit, :update, :destroy, :show]
  resources :statuses, path: 'reservations', only: [:index, :edit, :update, :destroy, :show]
  
  root 'static_pages#index'

  get 'about', to: 'static_pages#about'
end

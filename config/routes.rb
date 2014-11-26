Rails.application.routes.draw do
  resources :books
  get 'books/:id/reserve' => 'books#reserve', as: :reserve
end

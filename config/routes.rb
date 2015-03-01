Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:show, :edit, :create, :update] do
    get '/edit-categories', to: 'categories#edit'
    patch '/edit-categories', to: 'categories#edit'
    resources :categories, only: [:new, :create, :update, :destroy]
    resources :expenses, only: [:new, :edit, :create, :update, :destroy]
  end
  # Sessions Resources
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
end

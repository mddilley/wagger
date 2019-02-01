Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :update, :edit]
  get '/signup' => 'sessions#new'
  get '/login' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

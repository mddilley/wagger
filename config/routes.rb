Rails.application.routes.draw do
  resources :dogs
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :update, :edit]
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

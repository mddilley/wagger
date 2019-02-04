Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :update, :edit] do
    resources :dogs, only: [:index, :show]
  end
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  # resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

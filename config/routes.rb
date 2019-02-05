Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :update, :edit] do
    resources :dogs, only: [:index, :show, :new, :create, :edit, :update]
  end
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

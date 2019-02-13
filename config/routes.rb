Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :update, :edit] do
    resources :dogs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :play_dates, only: [:new, :create, :show, :update, :edit, :index, :destroy]
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/welcome' => 'welcome#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

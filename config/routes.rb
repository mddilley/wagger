Rails.application.routes.draw do
  root 'welcome#index'
  get '/users/:id/my_play_dates' => 'play_dates#index', as: :my_play_dates
  get '/play_dates/past' => 'play_dates#past', as: :past_play_dates
  resources :users, only: [:new, :create, :show, :update, :edit] do
    resources :dogs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :play_dates, only: [:new, :create, :show, :update, :edit, :index, :destroy]
  resources :dog_play_dates, only: [:destroy, :create]
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/welcome' => 'welcome#welcome'
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

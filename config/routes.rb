Rails.application.routes.draw do
  get '/auth/github/callback' => 'sessions#create'

  resources :posts, only: [:show, :edit, :update, :new, :create, :destroy]

  direct(:login) { "/auth/github?origin=#{request.original_url}" }

  root 'posts#index'
end

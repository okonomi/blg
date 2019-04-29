Rails.application.routes.draw do
  get '/auth/github/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :posts

  direct(:login) { "/auth/github?origin=#{request.original_url}" }

  root 'posts#index'
end

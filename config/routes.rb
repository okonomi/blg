Rails.application.routes.draw do
  get "/auth/github/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resource :auth, only: :show

  namespace :posts do
    resources :drafts, only: :index
  end
  resources :posts, param: :uid
  get "/feed", to: "posts#index", defaults: { format: :atom }
  resources :tags, only: :show
  direct(:login) { "/auth/github?origin=#{request.original_url}" }

  root "posts#index"

  mount Blg::Engine => "/blg"
end

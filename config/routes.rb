Rails.application.routes.draw do
  resource :auth, only: :show

  resources :posts, param: :uid
  direct(:login) { "/auth/github?origin=#{request.original_url}" }

  root "posts#index"
end

Rails.application.routes.draw do
  resources :posts, param: :uid

  root "posts#index"
end

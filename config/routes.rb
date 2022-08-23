Rails.application.routes.draw do
  resources :posts, param: :uid
end

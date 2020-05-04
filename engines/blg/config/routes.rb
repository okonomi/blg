Blg::Engine.routes.draw do
  resources :posts, param: :uid, only: :new
end

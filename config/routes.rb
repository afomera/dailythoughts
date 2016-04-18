Rails.application.routes.draw do
  devise_for :users
  resources :posts


  authenticated :user do
    root to: "posts#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home"
  end
end

Rails.application.routes.draw do

  resources :posts
  resources :users do
    resources :posts, only: [:index]
  end

  post 'socialize/follow' => 'socialize#follow_toggle'
  post 'login' => 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

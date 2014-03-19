Todo::Application.routes.draw do

  devise_for :users

  resources :lists do
    resources :items
  end

  root to: 'welcome#index'

end

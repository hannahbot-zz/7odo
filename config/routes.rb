Todo::Application.routes.draw do

  devise_for :users

  resources :lists do
    resources :items do
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users
      resources :lists
      resources :items
    end
  end

  root to: 'welcome#index'

end

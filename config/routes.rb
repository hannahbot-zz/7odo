Todo::Application.routes.draw do

  devise_for :users

  resources :lists do
    resources :items do
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  root to: 'welcome#index'

end

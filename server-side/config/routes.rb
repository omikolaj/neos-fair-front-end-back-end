Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {:format => :json} do 

    resources :users do
      collection do
        post 'login'
        post 'guest'
      end
      resources :drafts, :controller => :ad, type: 'Draft'
    end

    resources :ads

  end
end
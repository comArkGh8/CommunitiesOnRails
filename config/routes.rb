Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :communities do
    member do
      resources :residents do
        member do
          resources :articles
        end
      end

    end

    collection do
      get :search
    end


  end


  # You can have the root of your site routed with "root"
  root 'communities#index'

end

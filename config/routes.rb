Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :communities do
    
    member do
      post :create_resident
      post :edit_resident
      get :residents
      get :articles
      
      resources :residents do
        member do
          post :create_article
          post :edit_article
          get :articles
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
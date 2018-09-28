Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :communities do
    member do
      resources :residents do
        member do
          resources :articles do
            member do
              patch :ask_for
              put :ask_for
            end
          end
        end
      end
      post :create_article
      get :article
      get :new_article
      get :edit_article
      # PUT OR PATCH UPDATES
    end

    collection do
      get :search
    end

  end

  get 'community' => 'communities#show', :as => 'show_commune'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'





  # You can have the root of your site routed with "root"
  root 'communities#index'

end

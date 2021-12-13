Rails.application.routes.draw do
    root to: 'homes#top'
    get 'rank'=>'homes#rank'

  namespace :public do
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    resource :users
    resources :recipes, only: [:show, :index] do
        get :search, on: :collection
        resource :favorites, only: [:create, :destroy, :index]
        resources :recipe_comments, only: [:create, :destroy]
    end


    resources :stores , only: [:show] do
      get 'stores_recipe'=>'recipes#stores_recipe'
    end

  end

  namespace :admin do
     resources :recipes
     devise_for :stores, controllers: {
        sessions: 'stores/sessions',
        registrations: 'stores/registrations'
      }
       resources :stores
  end




end

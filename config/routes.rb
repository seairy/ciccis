Ciccis::Application.routes.draw do
  root :to => 'statistics#general'
  resources :statistics do
    collection do
      get :general, :occupation, :title
    end
  end
  resources :conventioners do
    collection do
      get :search, :registered, :unregistered, :chummage, :unoccupied, :collection_required, :opening_seats, :show_seats
    end
    member do
      get :register
      post :register
    end
  end
  resources :hotels do
    member do
      get :collection_required_conventioners
    end
    resources :rooms
  end
  resources :confucius_institutes do
    collection do
      get :search
    end
  end
  resources :users do
    collection do
      get 'edit_password'
      post 'update_password'
    end
  end
  resources :titles
  resources :excels do
    collection do
      get :all_conventioners
    end
  end
  resources :data do
    collection do
      get :analyze_uncascaded, :analyze_duplicated_name, :cascade_country, :cascade_title, :cascade_hotel, :invalid_country, :invalid_hotel
      post :analyze_collection_required
    end
  end
  match 'signin' => 'sessions#new', :as => :signin, :via => [:get]
  match 'signin' => 'sessions#create', :as => :signin, :via => [:post]
  match 'signout' => 'sessions#destroy', :as => :signout
end
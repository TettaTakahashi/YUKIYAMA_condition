Rails.application.routes.draw do

  get 'searches/search'
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :owners, skip: [:passwords], controllers: {
    registrations: "owner/registrations",
    sessions: 'owner/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
  
  root to: "homes#top"
  get 'homes/registration_top'
  get 'homes/session_top'
  
  
  
  scope module: :customer do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :ski_resorts, only: [:index, :show] do
       resources :reviews, only: [:create, :destroy]
       get :search, on: :collection
       member do
         post 'add', to: "favorite_resorts#create"
       end
    end
    resources :favorite_resorts, only: [:destroy]
    resources :prefecture, only: [:show]
  end
  
  scope module: :owner do
    get 'owners/my_page' => 'owners#show'
    get 'owners/information/edit' => 'owners#edit'
    patch 'owners/information' => 'owners#update'
    get 'owners/confirm_withdraw' => 'owners#confirm_withdraw'
    patch 'owners/withdraw' => 'owners#withdraw'
    get 'owners/ski_resorts' => 'ski_resorts#index'
    get 'owners/ski_resorts/:id' => 'ski_resorts#show', as: 'owners_ski_resort'
    resources :ski_resorts
  end
  
  namespace :admin do
    resources :prefecture, only: [:index, :edit, :create, :update]
    resources :ski_resorts, only: [:index, :show, :edit, :update] do
      resources :reviews, only: [:destroy]
    end
    resources :customers, only: [:index, :show, :edit, :update]
    resources :owners, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

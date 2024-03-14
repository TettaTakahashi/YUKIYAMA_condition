Rails.application.routes.draw do

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
  end
  
  scope module: :owner do
    get 'owners/my_page' => 'owners#show'
    get 'owners/information/edit' => 'owners#edit'
    patch 'owners/information' => 'owners#update'
    get 'owners/confirm_withdraw' => 'owners#confirm_withdraw'
    patch 'owners/withdraw' => 'owners#withdraw'
    resources :ski_resorts
  end
  
  namespace :admin do
    resources :prefecture, only: [:index, :edit, :create, :update]
    resources :ski_resorts, only: [:index]
    resources :customers, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

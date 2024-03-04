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
    
  end
  
  scope module: :owner do
    
  end
  
  namespace :admin do
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

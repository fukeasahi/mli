Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
    post '/admin/sign_in' => 'admin/sessions#create', as: :admin_session
    delete '/admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
  end

  namespace :admin do
    resources :customers, only: [:index]
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get '/customers/sign_in' => 'public/sessions#new', as: :new_customer_session
    post '/customers/sign_in' => 'public/sessions#create', as: :customer_session
    delete '/customers/sign_out' => 'public/sessions#destroy', as: :destroy_customer_session
    get '/customers/sign_up' => 'public/registrations#new', as: :new_customer_registration
    post '/customers' => 'public/registrations#create', as: :customer_registration
  end

  scope module: :public do
    root to: 'homes#top'
    get '/lines/about' => 'lines#about'
    resource :customers, only: [:edit, :update, :show]
  end

end

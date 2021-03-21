Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
    post '/admin/sign_in' => 'admin/sessions#create', as: :admin_session
    delete '/admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
  end
  
  devise_for :customers, skip: :all
  devise_scope :customer do
    get '/customers/sign_in' => 'public/sessions#new', as: :new_customer_session
    post '/customers/sign_in' => 'public/sessions#create', as: :customer_session
    delete '/customers/sign_out' => 'public/sessions#destroy', as: :destroy_customer_session
    get '/customers/password/new' => 'public/passwords#new', as: :new_customer_password
    get '/customers/password/edit' => 'public/passwords#edit', as: :edit_customer_password
    patch '/customers/password' => 'public/passwords#update', as: :customer_password
    put '/customers/password' => 'public/passwords#update'
    post '/customers/password' => 'public/passwords#create'
    get '/customers/cancel' => 'public/registrations#cancel', as: :cancel_customer_registration
    get '/customers/sign_up' => 'public/registrations#new', as: :new_customer_registration
    post '/customers' => 'puvlic/registrations#create', as: :customer_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
end

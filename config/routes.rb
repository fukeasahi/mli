Rails.application.routes.draw do
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
  get '/about', to: 'public/homes#about'
end

# new_customer_session GET    /customers/sign_in(.:format)                                                             plulic/sessions#new
#             customer_session POST   /customers/sign_in(.:format)                                                             plulic/sessions#create
#     destroy_customer_session DELETE /customers/sign_out(.:format)                                                            plulic/sessions#destroy
#       new_customer_password GET    /customers/password/new(.:format)                                                        devise/passwords#new
#       edit_customer_password GET    /customers/password/edit(.:format)                                                       devise/passwords#edit
#           customer_password PATCH  /customers/password(.:format)                                                            devise/passwords#update
#                             PUT    /customers/password(.:format)                                                            devise/passwords#update
#                             POST   /customers/password(.:format)                                                            devise/passwords#create
# cancel_customer_registration GET    /customers/cancel(.:format)                                                              devise/registrations#cancel
#   new_customer_registration GET    /customers/sign_up(.:format)                                                             devise/registrations#new
#   edit_customer_registration GET    /customers/edit(.:format)                                                                devise/registrations#edit
#       customer_registration PATCH  /customers(.:format)                                                                     devise/registrations#update
#                             PUT    /customers(.:format)                                                                     devise/registrations#update
#                             DELETE /customers(.:format)                                                                     devise/registrations#destroy
#                             POST   /customers(.:format)                                                                     devise/registrations#create
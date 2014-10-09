Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :respondents, :only => [:edit, :update]
  as :respondent do
    patch '/respondent/confirmation' => 'confirmations#update', :via => :patch, :as => :update_respondent_confirmation
  end
  devise_for :respondents, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }

  resources :assessments, :only => [:show, :update, :new, :create]

  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/terms-of-use',  as: "terms", to: 'static_pages#terms_of_use',  via: 'get'
  match '/legal-notice',  as: "legal_notice", to: 'static_pages#legal_notice',  via: 'get'
  match '/privacy-policy', as: "privacy_policy",  to: 'static_pages#privacy_policy',  via: 'get'

  root to: 'static_pages#home', via: :get
end

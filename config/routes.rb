Rails.application.routes.draw do

  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/terms-of-use',  as: "terms", to: 'static_pages#terms_of_use',  via: 'get'
  match '/legal-notice',  as: "legal_notice", to: 'static_pages#legal_notice',  via: 'get'
  match '/privacy-policy', as: "privacy_policy",  to: 'static_pages#privacy_policy',  via: 'get'

  root to: 'static_pages#home', via: :get
end

Rails.application.routes.draw do
  resources :registered_applications
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  devise_for :users
  get 'about' => 'welcome#about'
  get 'blocmetrics' => 'welcome#index'
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenitcated_root
    end
  end
end

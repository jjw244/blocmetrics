Rails.application.routes.draw do
  get 'about' => 'welcome#about'
  get 'blocmetrics' => 'welcome#index'

  root 'welcome#index'
end

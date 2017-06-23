Rails.application.routes.draw do
  # Set the root to the records index page
  root to: 'records#index'
  # All 7 resources for records
  resources :records, only: [:index, :show, :create, :update, :destroy]
end

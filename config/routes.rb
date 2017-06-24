Rails.application.routes.draw do
  # Set the root to the records index page
  # All 7 resources for records
  resources :records, only: [:index, :create, :destroy]
end

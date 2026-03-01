Rails.application.routes.draw do
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get "up" => "rails/health#show", as: :rails_health_check

  # Setting the homepage to land on list
  root "lists#index"

  # Defining the routes for lists, bookmarks and movie
  resources :lists do
    # Bookmarks does not exists on their own
    resources :bookmarks, only: [:new, :create]
  end

  # For destroy, we only need the bookmark id, not the list id
  # resources :bookmarks, :only :destroy
  delete "bookmarks/:id", to: "bookmarks#destroy"
end

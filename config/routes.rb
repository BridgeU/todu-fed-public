Rails.application.routes.draw do
  namespace :api do
    devise_for :users, controllers: {sessions: "api/sessions", registrations: "api/registrations"}, singular: :user

    resources :todo_lists, path: "lists", only: [:index, :create, :update, :show, :destroy] do
      resources :todo_items, path: "items", shallow: true, only: [:create, :update, :show, :destroy] do
        member do
          put :mark_complete
        end
      end
    end
  end
end
